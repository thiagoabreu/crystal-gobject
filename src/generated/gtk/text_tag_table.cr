module Gtk
  class TextTagTable < GObject::Object
    @pointer : Void*
    def initialize(pointer : LibGtk::TextTagTable*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::TextTagTable*)
    end

    # Implements Buildable
    def self.new : self
      __return_value = LibGtk.text_tag_table_new
      cast Gtk::TextTagTable.new(__return_value)
    end

    def add(tag)
      __return_value = LibGtk.text_tag_table_add(@pointer.as(LibGtk::TextTagTable*), tag.to_unsafe.as(LibGtk::TextTag*))
      __return_value
    end

    def foreach(func, data)
      LibGtk.text_tag_table_foreach(@pointer.as(LibGtk::TextTagTable*), func, data ? data : nil)
      nil
    end

    def size
      __return_value = LibGtk.text_tag_table_get_size(@pointer.as(LibGtk::TextTagTable*))
      __return_value
    end

    def lookup(name)
      __return_value = LibGtk.text_tag_table_lookup(@pointer.as(LibGtk::TextTagTable*), name.to_unsafe)
      Gtk::TextTag.new(__return_value) if __return_value
    end

    def remove(tag)
      LibGtk.text_tag_table_remove(@pointer.as(LibGtk::TextTagTable*), tag.to_unsafe.as(LibGtk::TextTag*))
      nil
    end

    alias TagAddedSignal = TextTagTable, Gtk::TextTag ->
    def on_tag_added(&__block : TagAddedSignal)
      __callback = ->(_arg0 : LibGtk::TextTagTable*, _arg1 : LibGtk::LibGtk::TextTag**) {
       __return_value = __block.call(TextTagTable.new(_arg0), Gtk::TextTag.new(_arg1))
       __return_value
      }
      connect("tag-added", __callback)
    end

    alias TagChangedSignal = TextTagTable, Gtk::TextTag, Bool ->
    def on_tag_changed(&__block : TagChangedSignal)
      __callback = ->(_arg0 : LibGtk::TextTagTable*, _arg1 : LibGtk::LibGtk::TextTag**, _arg2 : LibGtk::Bool*) {
       __return_value = __block.call(TextTagTable.new(_arg0), Gtk::TextTag.new(_arg1), _arg2)
       __return_value
      }
      connect("tag-changed", __callback)
    end

    alias TagRemovedSignal = TextTagTable, Gtk::TextTag ->
    def on_tag_removed(&__block : TagRemovedSignal)
      __callback = ->(_arg0 : LibGtk::TextTagTable*, _arg1 : LibGtk::LibGtk::TextTag**) {
       __return_value = __block.call(TextTagTable.new(_arg0), Gtk::TextTag.new(_arg1))
       __return_value
      }
      connect("tag-removed", __callback)
    end

  end
end

