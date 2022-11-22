# ShaderToy

A Gtk4 demo application using the Gtk4 shard.

## Compile time dependencies

You need the GTK libraries and their GObjectIntrospection files.

- Archlinux: `pacman -S gtk4 gobject-introspection`
- Ubuntu: `apt-get install libgtk-4-1 gobject-introspection gir1.2-gtk-4.0`
- macOS: `brew install gobject-introspection gtk4`

## Runtime dependencies

Just the GTK libraries are needed at runtime, i.e. not the `gobject-introspection` library and files.

## Execution

Use the script `build.sh` to compile the project. To run
the ShaderToy application, run `./shadertoy.out`.

Note: OpenGL raymarching code not included.

## Contributing

1. Fork it (<https://github.com/hugopl/gtk4.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Wim Neimeijer](https://github.com/gummybears) - creator and maintainer
