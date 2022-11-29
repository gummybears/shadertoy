require "gtk4"
require "./resources.cr"

class ShaderToy

  property app   : Gtk::Application
  property title : String = ""
  property changed : Bool = false

  def initialize
    @app = Gtk::Application.new("app.example.com", Gio::ApplicationFlags::None)
    @app.activate_signal.connect(->activate)
  end

  def run
    exit(@app.run)
  end

  def activate
    builder = Gtk::Builder.new_from_string(window_ui,window_ui.size)
    window  = Gtk::ApplicationWindow.cast builder["window"]

    #
    # remember window title
    #
    if window.title
      @title  = window.title.not_nil!
    end

    #
    # set natural width and height
    # Note: sometimes a black rectangle appears on the right when resizing the application window
    #
    scrolled_window = Gtk::ScrolledWindow.cast builder["scrolled_window"]
    scrolled_window.propagate_natural_width  = true
    scrolled_window.propagate_natural_height = true

    #
    # text view, set hexpand/vexpand to expand to size of scroll window
    #
    textview = Gtk::TextView.cast builder["textview"]
    textview.hexpand = true
    textview.vexpand = true

    textbuffer = Gtk::TextBuffer.cast builder["textbuffer"]
    textbuffer.changed_signal.connect(->textbuffer_changed)

    setup_menu(builder,window)

    window.application = @app
    window.present
  end

  def setup_menu_actions(builder : Gtk::Builder, window)

    action = Gio::SimpleAction.new("quit", nil)
    @app.add_action(action)
    action.activate_signal.connect do
      exit(0)
    end

    action = Gio::SimpleAction.new("open_file", nil)
    @app.add_action(action)
    action.activate_signal.connect do
      open_file(builder,window)
    end

    action = Gio::SimpleAction.new("new_file", nil)
    @app.add_action(action)
    action.activate_signal.connect do
      new_file(builder,window)
    end

  end

  #
  # set accelerator for menuitems "New", "Open", "Save", "Compile" and "Quit"
  #
  def setup_menu_accelerators()

    values = ["<Ctrl>N"]
    @app.set_accels_for_action("app.new_file", values)

    values = ["<Ctrl>O"]
    @app.set_accels_for_action("app.open_file", values)

    values = ["<Ctrl>S"]
    @app.set_accels_for_action("app.save", values)

    values = ["<Ctrl>C"]
    @app.set_accels_for_action("app.compile", values)

    values = ["<Ctrl>Q"]
    @app.set_accels_for_action("app.quit", values)
  end

  def setup_menu(builder : Gtk::Builder, window)

    menu_builder = Gtk::Builder.new_from_string(menu_ui,menu_ui.size)
    menu_model   = Gio::MenuModel.cast menu_builder["app_menu"]

    #
    # attach the menu to the menu button
    #
    button = Gtk::MenuButton.cast builder["gears"]
    button.menu_model = menu_model

    #
    # setup menu actions
    #
    setup_menu_actions(builder,window)

    #
    # setup menu accelerators
    #
    setup_menu_accelerators()

  end

  #
  # load empty string to text buffer
  # but only when text buffer has not be changed
  # by user
  #
  def clear_textbuffer(builder : Gtk::Builder)
    textbuffer = Gtk::TextBuffer.cast builder["textbuffer"]
    lines = [] of String
    lines = lines.join("\n")
    textbuffer.set_text(lines,lines.size)
  end

  def set_textbuffer(builder : Gtk::Builder, filename)
    textbuffer = Gtk::TextBuffer.cast builder["textbuffer"]
    lines      = File.read_lines(filename)
    lines      = lines.join("\n")
    textbuffer.set_text(lines,lines.size)
  end

  def get_textbuffer(builder : Gtk::Builder) : String
    textbuffer = Gtk::TextBuffer.cast builder["textbuffer"]
    text = textbuffer.text
    return text
  end

  def textbuffer_changed
    @changed = true
  end

  def new_file(builder,window)
    clear_textbuffer(builder)

    #
    # disable the following menu actions "Save" and "Compile"
    #
    compile_action = Gio::SimpleAction.new("save", nil)
    @app.remove_action("save")

    compile_action = Gio::SimpleAction.new("compile", nil)
    @app.remove_action("compile")
  end

  def save_file(builder,window)
    dialog = Gtk::FileChooserDialog.new(application: @app, title: "Save File", action: :save)
    dialog.transient_for = window
    dialog.add_button("Cancel", Gtk::ResponseType::Cancel.value)
    dialog.add_button("Save",   Gtk::ResponseType::Accept.value)
    text = get_textbuffer(builder)

    dialog.response_signal.connect do |response|
      case Gtk::ResponseType.from_value(response)

        when .accept?
          #
          # write text to file
          #
          text     = get_textbuffer(builder)
          filename = get_dialog_filename(dialog)
          if filename != ""

          end

        else


      end

      if dialog
        dialog.destroy
      end
    end

    dialog.present
  end

  def get_dialog_filename(dialog) : String

    s = ""
    x = dialog.file.try(&.path)
    if x
      filename = x.not_nil!
      s = filename.to_s
    end

    return s
  end

  def open_file(builder : Gtk::Builder, window)

    dialog = Gtk::FileChooserDialog.new(application: @app, title: "Open File", action: :open)

    #
    # set file filter
    #
    filefilter = Gtk::FileFilter.cast builder["filefilter"]
    dialog.filter = filefilter

    #
    # need to set transient window, otherwise Gtk complains
    #
    dialog.transient_for = window

    #
    # add Cancel and Open buttons to file chooser
    # no stock images shown, only text
    #
    dialog.add_button("Cancel", Gtk::ResponseType::Cancel.value)
    dialog.add_button("Open",   Gtk::ResponseType::Accept.value)

    #
    # set the current directory for the file chooser
    #
    dialog.current_folder = Gio::File.new_for_path(Dir.current)
    dialog.response_signal.connect do |response|
      case Gtk::ResponseType.from_value(response)

        when .accept?

          filename = get_dialog_filename(dialog)
          if filename != ""
            if File.directory?(filename) == false && File.readable?(filename)

              set_textbuffer(builder,filename)
              #
              # update window title
              #
              window.title = @title + " | " + filename

              #
              # add actions for Save and Compile
              #
              action = Gio::SimpleAction.new("save", nil)
              @app.add_action(action)
              action.activate_signal.connect do
                save_file(builder,window)
              end

              action = Gio::SimpleAction.new("compile", nil)
              @app.add_action(action)
              action.activate_signal.connect do
                compile(filename.to_s)
              end

            end
          end

        else

      end

      if dialog
        dialog.destroy
      end

    end
    dialog.present
  end

  def compile(filename : String)
    puts "compile #{filename}"
  end

end
