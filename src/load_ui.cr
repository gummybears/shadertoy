require "gtk4"

def activate(app : Gtk::Application)

  filename = "try2.glade"
  builder = Gtk::Builder.new_from_file("#{__DIR__}/#{filename}")

  #
  # menu
  #
  app.menubar = Gio::MenuModel.cast builder["menubar"]

  # old code window = Gtk::ApplicationWindow.new(application: app)
  # old code window = Gtk::Window.cast builder["window"]

  window = Gtk::ApplicationWindow.cast builder["window"]
  window.application = app
  window.title = filename
  window.set_default_size(800,640)
  window.show_menubar
  window.maximize
  window.present
end

def quit_app
  exit(0)
end

app = Gtk::Application.new("try1.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Gtk::Application))
exit(app.run)

