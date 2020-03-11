import re
from xkeysnail.transform import *

# CAPSLOCK interaction and LEFT_CTRL
define_multipurpose_modmap({
    Key.ENTER: [Key.ENTER, Key.RIGHT_CTRL],
    Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
    Key.LEFT_CTRL: [Key.CAPSLOCK, Key.LEFT_CTRL],
    # Key.LEFT_CTRL: [Key.CAPSLOCK, Key.LEFT_CTRL],
    # Key.SPACE: [Key.SPACE, Key.LEFT_META],
    # Key.SYSRQ: [Key.SYSRQ, Key.RIGHT_META],
})
