require "gtk4"

class ShaderToy
  #include Enumerable(String)

  property app : Gtk::Application

  def activate
    filename    = "window.ui"
    builder     = Gtk::Builder.new_from_file("#{__DIR__}/#{filename}")
    window      = Gtk::ApplicationWindow.cast builder["window"]

    load_menu(builder)

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

  def load_file
  end


  def quit_app
  end

  def load_menu(builder)

    filename     = "menu.ui"
    menu_builder = Gtk::Builder.new_from_file("#{__DIR__}/#{filename}")
    menu_model   = Gio::MenuModel.cast menu_builder["app_menu"]

    #
    # attach the menu to the menu button
    #
    button = Gtk::MenuButton.cast builder["gears"]
    button.menu_model = menu_model

    # app_actions = [] of Gio::ActionEntry # = ["load", ->load_file, "quit", -> quit_app]
    #
    # app_action = Gio::
    # #app_entries << Gio::ActionEntry.new("quit")
    # #app_entries =
    # @app.map_add_action_entries(app_actions)

    # set accelerator for menuitem "Quit"
    values = ["<Ctrl>Q"]
    @app.set_accels_for_action("app.quit", values)
  end
end

app = ShaderToy.new
app.run
