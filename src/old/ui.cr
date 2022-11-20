#def ui1
#  s = <<-EOT
#  <?xml version="1.0" encoding="UTF-8"?>
#  <!-- Generated with glade 3.22.1 -->
#  <interface>
#    <requires lib="gtk+" version="3.8"/>
#    <object class="GtkFileFilter" id="filefilter1">
#      <patterns>
#        <pattern>*.txt</pattern>
#        <pattern>*.vs</pattern>
#        <pattern>*.fs</pattern>
#      </patterns>
#    </object>
#    <object class="GtkTextBuffer" id="textbuffer1"/>
#    <object class="GtkWindow" id="window">
#      <property name="width_request">800</property>
#      <property name="height_request">600</property>
#      <property name="can_focus">False</property>
#      <property name="hexpand">True</property>
#      <property name="vexpand">True</property>
#      <property name="title" translatable="yes">ShaderToy</property>
#      <child>
#        <placeholder/>
#      </child>
#      <child>
#        <object class="GtkBox" id="box1">
#          <property name="visible">True</property>
#          <property name="can_focus">False</property>
#          <property name="orientation">vertical</property>
#          <child>
#            <object class="GtkScrolledWindow" id="scrolledwindow">
#              <property name="visible">True</property>
#              <property name="can_focus">True</property>
#              <property name="shadow_type">in</property>
#              <child>
#                <object class="GtkTextView" id="textview1">
#                  <property name="visible">True</property>
#                  <property name="can_focus">True</property>
#                  <property name="buffer">textbuffer1</property>
#                </object>
#              </child>
#            </object>
#            <packing>
#              <property name="expand">True</property>
#              <property name="fill">True</property>
#              <property name="position">1</property>
#            </packing>
#          </child>
#          <child>
#            <object class="GtkStatusbar" id="statusbar1">
#              <property name="visible">True</property>
#              <property name="can_focus">False</property>
#              <property name="margin_left">10</property>
#              <property name="margin_right">10</property>
#              <property name="margin_start">10</property>
#              <property name="margin_end">10</property>
#              <property name="margin_top">6</property>
#              <property name="margin_bottom">6</property>
#              <property name="orientation">vertical</property>
#              <property name="spacing">2</property>
#            </object>
#            <packing>
#              <property name="expand">False</property>
#              <property name="fill">True</property>
#              <property name="position">2</property>
#            </packing>
#          </child>
#        </object>
#      </child>
#    </object>
#    <object class="GtkFileChooserDialog" id="filechooserdialog1">
#      <property name="width_request">500</property>
#      <property name="height_request">500</property>
#      <property name="can_focus">False</property>
#      <property name="can_default">False</property>
#      <property name="halign">start</property>
#      <property name="valign">baseline</property>
#      <property name="border_width">12</property>
#      <property name="title" translatable="yes">Select Shader </property>
#      <property name="resizable">False</property>
#      <property name="modal">True</property>
#      <property name="window_position">center-on-parent</property>
#      <property name="destroy_with_parent">True</property>
#      <property name="type_hint">normal</property>
#      <property name="transient_for">window</property>
#      <property name="has_resize_grip">True</property>
#      <property name="create_folders">False</property>
#      <property name="filter">filefilter1</property>
#      <child>
#        <placeholder/>
#      </child>
#      <child internal-child="vbox">
#        <object class="GtkBox" id="filechooserdialog-vbox1">
#          <property name="width_request">1000</property>
#          <property name="height_request">800</property>
#          <property name="visible">True</property>
#          <property name="can_focus">True</property>
#          <property name="has_focus">True</property>
#          <property name="orientation">vertical</property>
#          <property name="spacing">2</property>
#          <child internal-child="action_area">
#            <object class="GtkButtonBox" id="filechooserdialog-action_area1">
#              <property name="can_focus">False</property>
#              <property name="layout_style">end</property>
#              <child>
#                <object class="GtkButton" id="filechooser_open">
#                  <property name="label">gtk-open</property>
#                  <property name="visible">True</property>
#                  <property name="can_focus">True</property>
#                  <property name="can_default">True</property>
#                  <property name="receives_default">True</property>
#                  <property name="use_stock">True</property>
#                </object>
#                <packing>
#                  <property name="expand">True</property>
#                  <property name="fill">True</property>
#                  <property name="position">0</property>
#                </packing>
#              </child>
#              <child>
#                <object class="GtkButton" id="filechooser_cancel">
#                  <property name="label">gtk-cancel</property>
#                  <property name="visible">True</property>
#                  <property name="can_focus">True</property>
#                  <property name="receives_default">False</property>
#                  <property name="use_stock">True</property>
#                </object>
#                <packing>
#                  <property name="expand">True</property>
#                  <property name="fill">True</property>
#                  <property name="position">1</property>
#                </packing>
#              </child>
#            </object>
#            <packing>
#              <property name="expand">False</property>
#              <property name="fill">False</property>
#              <property name="position">0</property>
#            </packing>
#          </child>
#          <child>
#            <placeholder/>
#          </child>
#        </object>
#      </child>
#    </object>
#  </interface>
#  EOT
#  return s
#end
#
#def ui2
#
#  s = <<-EOT
#<?xml version="1.0" encoding="UTF-8"?>
#<!-- Generated with glade 3.22.1 -->
#<interface>
#  <requires lib="gtk+" version="3.8"/>
#  <object class="GtkFileFilter" id="filefilter1">
#    <patterns>
#      <pattern>*.txt</pattern>
#      <pattern>*.vs</pattern>
#      <pattern>*.fs</pattern>
#    </patterns>
#  </object>
#  <object class="GtkTextBuffer" id="textbuffer1"/>
#  <object class="GtkWindow" id="window">
#    <property name="width_request">800</property>
#    <property name="height_request">600</property>
#    <property name="can_focus">False</property>
#    <property name="hexpand">True</property>
#    <property name="vexpand">True</property>
#    <property name="title" translatable="yes">ShaderToy</property>
#    <child>
#      <placeholder/>
#    </child>
#    <child>
#      <object class="GtkBox" id="box1">
#        <property name="visible">True</property>
#        <property name="can_focus">False</property>
#        <property name="orientation">vertical</property>
#        <child>
#          <object class="GtkMenuBar" id="menubar1">
#            <property name="visible">True</property>
#            <property name="can_focus">False</property>
#            <child>
#              <object class="GtkMenuItem" id="menuitem1">
#                <property name="visible">True</property>
#                <property name="can_focus">False</property>
#                <property name="label" translatable="yes">_File</property>
#                <property name="use_underline">True</property>
#                <child type="submenu">
#                  <object class="GtkMenu" id="menu1">
#                    <property name="visible">True</property>
#                    <property name="can_focus">False</property>
#                    <child>
#                      <object class="GtkImageMenuItem" id="file_open">
#                        <property name="label">gtk-open</property>
#                        <property name="visible">True</property>
#                        <property name="can_focus">False</property>
#                        <property name="use_underline">True</property>
#                        <property name="use_stock">True</property>
#                      </object>
#                    </child>
#                    <child>
#                      <object class="GtkSeparatorMenuItem" id="separatormenuitem1">
#                        <property name="visible">True</property>
#                        <property name="can_focus">False</property>
#                      </object>
#                    </child>
#                    <child>
#                      <object class="GtkImageMenuItem" id="app_quit">
#                        <property name="label">gtk-quit</property>
#                        <property name="visible">True</property>
#                        <property name="can_focus">False</property>
#                        <property name="use_underline">True</property>
#                        <property name="use_stock">True</property>
#                      </object>
#                    </child>
#                  </object>
#                </child>
#              </object>
#            </child>
#            <child>
#              <object class="GtkMenuItem" id="shader">
#                <property name="visible">True</property>
#                <property name="can_focus">False</property>
#                <property name="label" translatable="yes">Shader</property>
#                <property name="use_underline">True</property>
#              </object>
#            </child>
#          </object>
#          <packing>
#            <property name="expand">False</property>
#            <property name="fill">True</property>
#            <property name="position">0</property>
#          </packing>
#        </child>
#        <child>
#          <object class="GtkScrolledWindow" id="scrolledwindow">
#            <property name="visible">True</property>
#            <property name="can_focus">True</property>
#            <property name="shadow_type">in</property>
#            <child>
#              <object class="GtkTextView" id="textview1">
#                <property name="visible">True</property>
#                <property name="can_focus">True</property>
#                <property name="buffer">textbuffer1</property>
#              </object>
#            </child>
#          </object>
#          <packing>
#            <property name="expand">True</property>
#            <property name="fill">True</property>
#            <property name="position">1</property>
#          </packing>
#        </child>
#        <child>
#          <object class="GtkStatusbar" id="statusbar1">
#            <property name="visible">True</property>
#            <property name="can_focus">False</property>
#            <property name="margin_left">10</property>
#            <property name="margin_right">10</property>
#            <property name="margin_start">10</property>
#            <property name="margin_end">10</property>
#            <property name="margin_top">6</property>
#            <property name="margin_bottom">6</property>
#            <property name="orientation">vertical</property>
#            <property name="spacing">2</property>
#          </object>
#          <packing>
#            <property name="expand">False</property>
#            <property name="fill">True</property>
#            <property name="position">2</property>
#          </packing>
#        </child>
#      </object>
#    </child>
#  </object>
#  <object class="GtkFileChooserDialog" id="filechooserdialog1">
#    <property name="width_request">500</property>
#    <property name="height_request">500</property>
#    <property name="can_focus">False</property>
#    <property name="can_default">False</property>
#    <property name="halign">start</property>
#    <property name="valign">baseline</property>
#    <property name="border_width">12</property>
#    <property name="title" translatable="yes">Select Shader </property>
#    <property name="resizable">False</property>
#    <property name="modal">True</property>
#    <property name="window_position">center-on-parent</property>
#    <property name="destroy_with_parent">True</property>
#    <property name="type_hint">normal</property>
#    <property name="transient_for">window</property>
#    <property name="has_resize_grip">True</property>
#    <property name="create_folders">False</property>
#    <property name="filter">filefilter1</property>
#    <child>
#      <placeholder/>
#    </child>
#    <child internal-child="vbox">
#      <object class="GtkBox" id="filechooserdialog-vbox1">
#        <property name="width_request">1000</property>
#        <property name="height_request">800</property>
#        <property name="visible">True</property>
#        <property name="can_focus">True</property>
#        <property name="has_focus">True</property>
#        <property name="orientation">vertical</property>
#        <property name="spacing">2</property>
#        <child internal-child="action_area">
#          <object class="GtkButtonBox" id="filechooserdialog-action_area1">
#            <property name="can_focus">False</property>
#            <property name="layout_style">end</property>
#            <child>
#              <object class="GtkButton" id="filechooser_open">
#                <property name="label">gtk-open</property>
#                <property name="visible">True</property>
#                <property name="can_focus">True</property>
#                <property name="can_default">True</property>
#                <property name="receives_default">True</property>
#                <property name="use_stock">True</property>
#              </object>
#              <packing>
#                <property name="expand">True</property>
#                <property name="fill">True</property>
#                <property name="position">0</property>
#              </packing>
#            </child>
#            <child>
#              <object class="GtkButton" id="filechooser_cancel">
#                <property name="label">gtk-cancel</property>
#                <property name="visible">True</property>
#                <property name="can_focus">True</property>
#                <property name="receives_default">False</property>
#                <property name="use_stock">True</property>
#              </object>
#              <packing>
#                <property name="expand">True</property>
#                <property name="fill">True</property>
#                <property name="position">1</property>
#              </packing>
#            </child>
#          </object>
#          <packing>
#            <property name="expand">False</property>
#            <property name="fill">False</property>
#            <property name="position">0</property>
#          </packing>
#        </child>
#        <child>
#          <placeholder/>
#        </child>
#      </object>
#    </child>
#  </object>
#</interface>
#EOT
#  return s
#end

def ui3()
  s = <<-EOT
<?xml version="1.0" encoding="UTF-8"?>
<!-- Generated with glade 3.22.1 -->
<interface>
  <requires lib="gtk+" version="3.8"/>
  <object class="GtkFileFilter" id="filefilter1">
    <patterns>
      <pattern>*.txt</pattern>
      <pattern>*.vs</pattern>
      <pattern>*.fs</pattern>
    </patterns>
  </object>
  <object class="GtkTextBuffer" id="textbuffer1"/>
  <object class="GtkWindow" id="window">
    <property name="width_request">800</property>
    <property name="height_request">600</property>
    <property name="can_focus">False</property>
    <property name="hexpand">True</property>
    <property name="vexpand">True</property>
    <property name="title" translatable="yes">ShaderToy</property>
    <child>
      <placeholder/>
    </child>
    <child>
      <object class="GtkBox" id="box1">
        <property name="visible">True</property>
        <property name="can_focus">False</property>
        <property name="orientation">vertical</property>
        <child>
          <object class="GtkScrolledWindow" id="scrolledwindow">
            <property name="visible">True</property>
            <property name="can_focus">True</property>
            <child>
              <object class="GtkTextView" id="textview1">
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="buffer">textbuffer1</property>
              </object>
            </child>
          </object>
        </child>
        <child>
          <object class="GtkStatusbar" id="statusbar1">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
            <property name="margin_start">10</property>
            <property name="margin_end">10</property>
            <property name="margin_top">6</property>
            <property name="margin_bottom">6</property>
          </object>
        </child>
      </object>
    </child>
  </object>
  <object class="GtkFileChooserDialog" id="filechooserdialog1">
    <property name="width_request">500</property>
    <property name="height_request">500</property>
    <property name="can_focus">False</property>
    <property name="halign">start</property>
    <property name="valign">baseline</property>
    <property name="title" translatable="yes">Select Shader </property>
    <property name="resizable">False</property>
    <property name="modal">True</property>
    <property name="destroy_with_parent">True</property>
    <property name="transient_for">window</property>
    <property name="create_folders">False</property>
    <property name="filter">filefilter1</property>
    <child>
      <placeholder/>
    </child>
  </object>
</interface>
EOT
  return s

end
