cd ..
pyinstaller --onefile --icon=examples/assets/gallery.ico ^
--add-data="RinUI;RinUI" ^
--add-data="examples;./" ^
--add-data="examples/gallery.qml;./" ^
--paths=. ^
examples/gallery.py
