require "gtk4"

#
#def load_file(textbuffer : Gtk::TextBuffer
##def load_file(builder, filename : String)
#
#
#  #if File.exists?(filename) == false
#  #
#  #  # display error in alert box, statusbar etc
#  #  return
#  #end
#
#  #
#  # create scrolled window
#  #
#  scrolled_window = Gtk::ScrolledWindow.new
#  scrolled_window.hexpand = true
#  scrolled_window.vexpand = true
#
#  textview = Gtk::TextView.new
#
#  stack_window = Gtk::Stack.cast(builder["stack"])
#  scrolled_window.child = textview
#
#  #
#  # add scrolled window to stack
#  #
#  stack_window.add_titled(scrolled_window,"abcde","fgh")
#
#  #stack_window.add_titled(
#
#  #scrolled = gtk_scrolled_window_new ();
#  #gtk_widget_set_hexpand (scrolled, TRUE);
#  #gtk_widget_set_vexpand (scrolled, TRUE);
#  #view = gtk_text_view_new ();
#  #gtk_text_view_set_editable (GTK_TEXT_VIEW (view), FALSE);
#  #gtk_text_view_set_cursor_visible (GTK_TEXT_VIEW (view), FALSE);
#  #gtk_scrolled_window_set_child (GTK_SCROLLED_WINDOW (scrolled), view);
#  #gtk_stack_add_titled (GTK_STACK (win->stack), scrolled, basename, basename);
#  #
#  #if (g_file_load_contents (file, NULL, &contents, &length, NULL, NULL))
#  #  {
#  #    GtkTextBuffer *buffer;
#  #
#  #    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));
#  #    gtk_text_buffer_set_text (buffer, contents, length);
#  #    g_free (contents);
#  #  }
#  #
#end
#

def load_menu
  filename = "menu.ui"
  builder  = Gtk::Builder.new_from_file("#{__DIR__}/#{filename}")
  menu     = Gtk::MenuModel.cast builder["menu"]

  # attach the menu to the menu button
  #gtk_menu_button_set_menu_model (GTK_MENU_BUTTON (priv->gears), menu);
end

def activate(app : Gtk::Application)
  filename = "window.ui"
  builder  = Gtk::Builder.new_from_file("#{__DIR__}/#{filename}")
  window   = Gtk::ApplicationWindow.cast builder["window"]
  window.title = "Example Application"
  window.application = app

  load_menu

  window.present
end

def quit_app
  exit(0)
end

app = Gtk::Application.new("app.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Gtk::Application))
#app.open_signal.connect(->load_file) #(Gtk::Builder, String))
#app.open do
#  filename = "window.ui"
#  builder  = Gtk::Builder.new_from_file("#{__DIR__}/#{filename}")
#  stack_window = Gtk::Stack.cast(builder["stack"])
#end

#Gtk::Builder, String))

exit(app.run)

