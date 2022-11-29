def menu_ui
  s = <<-EOT
<?xml version="1.0" encoding="UTF-8"?>
<interface>
  <menu id="app_menu">
    <section>
      <item>
        <attribute name="label" translatable="yes">_New</attribute>
        <attribute name="action">app.new_file</attribute>
      </item>

      <item>
        <attribute name="label" translatable="yes">_Open</attribute>
        <attribute name="action">app.open_file</attribute>
      </item>

      <item>
        <attribute name="label" translatable="yes">_Save</attribute>
        <attribute name="action">app.save</attribute>
      </item>

    </section>

    <section>
      <item>
        <attribute name="label" translatable="yes">_Compile</attribute>
        <attribute name="action">app.compile</attribute>
      </item>
    </section>

    <section>
      <item>
        <attribute name="label" translatable="yes">_Quit</attribute>
        <attribute name="action">app.quit</attribute>
      </item>
    </section>
  </menu>
</interface>
EOT
  return s
end

def window_ui

  s = <<-EOT
<?xml version="1.0" encoding="UTF-8"?>
<interface>
  <requires lib="gtk" version="4.0"/>
  <object class="GtkFileFilter" id="filefilter">
    <patterns>
      <pattern>*.txt</pattern>
      <pattern>*.fs</pattern>
      <pattern>*.vs</pattern>
    </patterns>
  </object>
  <object class="GtkTextBuffer" id="textbuffer"/>
  <object class="GtkApplicationWindow" id="window">
    <property name="title" translatable="yes">ShaderToy</property>
    <property name="default-width">600</property>
    <property name="default-height">400</property>
    <child type="titlebar">
      <object class="GtkHeaderBar" id="header">
        <child type="end">
          <object class="GtkMenuButton" id="gears">
            <property name="direction">none</property>
          </object>
        </child>
        <child type="end">
          <object class="GtkToggleButton" id="search">
            <property name="sensitive">0</property>
            <property name="icon-name">edit-find-symbolic</property>
          </object>
        </child>
      </object>
    </child>
    <child>
      <object class="GtkBox" id="box">
        <property name="orientation">vertical</property>
        <child>
          <object class="GtkScrolledWindow" id="scrolled_window">
            <property name="visible">True</property>
            <child>
              <object class="GtkTextView" id="textview">
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="buffer">textbuffer</property>
              </object>
            </child>
          </object>
        </child>
      </object>
    </child>
  </object>
</interface>
EOT
  return s
end
