require "gtk4"
require "./ui.cr"

def activate(app : Gtk::Application)
  window = Gtk::ApplicationWindow.new(app)
  window.title = "Gtk Builder"
  window.set_default_size(200, 200)

  ui = ui3()

  builder = Gtk::Builder.new_from_string(ui, ui.bytesize.to_i64)
  root = Gtk::Widget.cast(builder["root"])

  window.child = root
  window.present
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Gtk::Application))
exit(app.run)

