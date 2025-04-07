pragma Singleton
import QtQuick 2.15

QtObject {
    id: typography

    enum Type {
        Top,
        Bottom,
        TopLeft,
        TopRight,
        BottomLeft,
        BottomRight,
        None
    }
}
