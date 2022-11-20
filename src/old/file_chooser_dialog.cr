# run in directory where shard is located
require "gtk4"

def activate(app : Gtk::Application)
  dialog = Gtk::FileChooserDialog.new(application: app, title: "Choose a file", action: :open)
  dialog.add_button("Cancel", Gtk::ResponseType::Cancel.value)
  dialog.add_button("Open", Gtk::ResponseType::Accept.value)

  dialog.response_signal.connect do |response|
    case Gtk::ResponseType.from_value(response)
    when .cancel? then puts "Cancelled."
    when .accept? then puts "You choose: #{dialog.file.try(&.path)}"
    end
    dialog.destroy
  end
  dialog.present
end

def clicked(button : Gtk::Button, new_clicks : Int32)
    button.label = "Clicked #{new_clicks}"
end

def appwindow(app : Gtk::Application)
  window = Gtk::ApplicationWindow.new(app)
  window.title = "ShaderToy"
  #window.set_default_size(800, 640)
  #window.child = root

  window.maximize
  window.present
end

GTK_DEBUG=interactive

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
#appwindow(app)
app.activate_signal.connect(->appwindow(Gtk::Application))


exit(app.run)
