require "gtk4"

class ShaderToy

  property app : Gtk::Application

  def activate
    filename  = "window.ui"
    builder   = Gtk::Builder.new_from_file("#{__DIR__}/#{filename}")
    window    = Gtk::ApplicationWindow.cast builder["window"]

    setup_menu(builder,window)

    # we could set the title in window.ui
    window.title = "Example Application"
    window.application = app
    window.present
  end

  def initialize
    @app = Gtk::Application.new("app.example.com", Gio::ApplicationFlags::None)
    @app.activate_signal.connect(->activate)
  end

  def run
    exit(@app.run)
  end

  def setup_menu(builder,window)

    filename     = "menu.ui"
    menu_builder = Gtk::Builder.new_from_file("#{__DIR__}/#{filename}")
    menu_model   = Gio::MenuModel.cast menu_builder["app_menu"]

    #
    # attach the menu to the menu button
    #
    button = Gtk::MenuButton.cast builder["gears"]
    button.menu_model = menu_model

    #
    # setup menu actions
    #
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

    #
    # set accelerator for menuitem "Open" and "Quit"
    #
    values = ["<Ctrl>Q"]
    @app.set_accels_for_action("app.quit", values)

    values = ["<Ctrl>O"]
    @app.set_accels_for_action("app.open_file", values)
  end

  def filechooserdialog(builder,window)

    textbuffer = Gtk::TextBuffer.cast builder["textbuffer"]
    statusbar  = Gtk::Statusbar.cast  builder["statusbar"]
    filefilter = Gtk::FileFilter.cast builder["filefilter"]

    context_id = statusbar.context_id("statusbar")
    statusbar.push(context_id, "")

    dialog = Gtk::FileChooserDialog.new(application: app, title: "Choose fragment shader file", action: :open)
    dialog.filter        = filefilter
    dialog.transient_for = window
    dialog.add_button("Cancel", Gtk::ResponseType::Cancel.value)
    dialog.add_button("Open", Gtk::ResponseType::Accept.value)

    #
    # set the current directory for the file chooser
    #
    dialog.current_folder = Gio::File.new_for_path(Dir.current)
    dialog.response_signal.connect do |response|
      case Gtk::ResponseType.from_value(response)
        when .cancel?

          statusbar.push(context_id, "Cancelled")

        when .accept?

          x = dialog.file.try(&.path)
          if x
            filename = x.not_nil!

            if File.directory?(filename) == false && File.readable?(filename)
              lines      = File.read_lines(filename)
              lines      = lines.join("\n")
              textbuffer.set_text(lines,lines.size)

              statusbar.push(context_id, "Loaded file #{filename}")
            end
          end

        else

      end
      dialog.destroy
    end
    dialog.present
  end
end

app = ShaderToy.new
app.run

