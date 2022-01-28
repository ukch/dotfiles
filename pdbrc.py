from pygments.formatters import Terminal256Formatter
from pygments.lexers import PythonLexer
from pygments.styles import get_style_by_name
import pdb


class Config(pdb.DefaultConfig):

    sticky_by_default = True

    def setup(self, pdb):
        super().setup(pdb)
        pdb.__class__._lexer = PythonLexer()
        pdb.__class__._fmt = Terminal256Formatter(style=get_style_by_name("vim"))
