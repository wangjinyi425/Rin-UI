cd ..
.venv\Scripts\pyinstaller.exe  --icon=examples/assets/gallery.ico ^
--noconsole ^
--add-data="RinUI;RinUI" ^
--add-data="examples;./" ^
--add-data="examples/gallery.qml;./" ^
--paths=. ^
examples/gallery.py
