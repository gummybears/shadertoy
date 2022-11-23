require "gtk4"
require "./resources.cr"

class ShaderToy

  property app   : Gtk::Application
  property title : String = ""

  def initialize
    @app = Gtk::Application.new("app.example.com", Gio::ApplicationFlags::None)
    @app.activate_signal.connect(->activate)
  end

  def run
    exit(@app.run)
  end

  def resize_scrolled_window(window)

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
      filechooserdialog(builder,window)
    end

    action = Gio::SimpleAction.new("new_file", nil)
    @app.add_action(action)
    action.activate_signal.connect do
      clear_textbuffer(builder,window)

      #
      # disable the following menu actions
      #

      # disable Save
      compile_action = Gio::SimpleAction.new("save", nil)
      @app.remove_action("save")

      # disable Save As
      compile_action = Gio::SimpleAction.new("save_as", nil)
      @app.remove_action("save_as")

      # disable Compile
      compile_action = Gio::SimpleAction.new("compile", nil)
      @app.remove_action("compile")
    end
  end

  #
  # set accelerator for menuitems "New", "Open", "Save", "Save As" and "Quit"
  #
  def setup_menu_accelerators()

    values = ["<Ctrl>N"]
    @app.set_accels_for_action("app.new_file", values)

    values = ["<Ctrl>O"]
    @app.set_accels_for_action("app.open_file", values)

    values = ["<Ctrl>S"]
    @app.set_accels_for_action("app.save", values)

    values = ["<Ctrl>A"]
    @app.set_accels_for_action("app.save_as", values)

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
  def clear_textbuffer(builder : Gtk::Builder, window)

    textbuffer = Gtk::TextBuffer.cast builder["textbuffer"]

    lines = [] of String
    lines = lines.join("\n")
    textbuffer.set_text(lines,lines.size)
  end

  def set_textbuffer(builder : Gtk::Builder, window,filename)

    textbuffer = Gtk::TextBuffer.cast builder["textbuffer"]

    lines      = File.read_lines(filename)
    lines      = lines.join("\n")
    textbuffer.set_text(lines,lines.size)

    #
    # update window title
    #
    window.title = @title + " | " + filename.to_s

  end

  def filechooserdialog(builder : Gtk::Builder, window)

    dialog = Gtk::FileChooserDialog.new(application: @app, title: "Choose fragment shader file", action: :open)

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

          x = dialog.file.try(&.path)
          if x
            filename = x.not_nil!
            if File.directory?(filename) == false && File.readable?(filename)

              set_textbuffer(builder,window,filename)

              #
              # add actions for Save, Save As and Compile
              #
              action = Gio::SimpleAction.new("save", nil)
              @app.add_action(action)
              action.activate_signal.connect do
                save_file(filename)
              end

              action = Gio::SimpleAction.new("save_as", nil)
              @app.add_action(action)
              action.activate_signal.connect do
                save_file_as()
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
      dialog.destroy
    end
    dialog.present
  end

  def compile(filename : String)
    puts "compile #{filename}"
  end

  def save_file(filename)
    puts "save #{filename}"
  end

  def save_file_as()
    puts "save as"
  end


end
