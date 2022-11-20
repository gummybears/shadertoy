require "gtk4"

class ShaderToy

  property app     : Gtk::Application

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

  def load_menu(builder)
    filename     = "menu.ui"
    menu_builder = Gtk::Builder.new_from_file("#{__DIR__}/#{filename}")
    menu_model   = Gio::MenuModel.cast menu_builder["app_menu"]

    # attach the menu to the menu button
    button = Gtk::MenuButton.cast builder["gears"]
    button.menu_model = menu_model
    #gtk_menu_button_set_menu_model (GTK_MENU_BUTTON (priv->gears), menu);
  end
end

app = ShaderToy.new
app.run
