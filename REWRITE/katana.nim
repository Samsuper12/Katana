import gintro/[gtk4, gobject, gio, pango, glib, adw]
import std/with
import page
import widgets/path

proc activate(app: gtk4.Application) =

  let
    dir = "."
    window = adw.newApplicationWindow(app)
    mainBox = newBox(Orientation.vertical, 0)
    backBtn = newButtonFromIconName("go-previous-symbolic") # temp?
    pathWidget = createPathWidget(dir)
    page = createListView(dir, true, backBtn, pathWidget)
    header = adw.newHeaderBar()


  header.packStart backBtn
  header.titleWidget = pathWidget
  with mainBox: 
    append header
    append page
  
  # header.titleWidget = pathWidget

  with window:
    content = mainBox
    title = "Katana"
    defaultSize = (400, 600)
    show


when isMainModule:
  let app = newApplication("com.github.gavr123456789.Katana")
  app.connect("activate", activate)
  discard run(app)