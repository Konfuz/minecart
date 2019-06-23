##
## Generate a template file for translation purposes
##

import os, fnmatch, re

pattern = re.compile(r'[ \.=^\t]S\("(.+?)"\)', re.DOTALL)


def gen_template(templ_file, lkeyStrings):
    lOut = []
    lkeyStrings.sort()
    for s in lkeyStrings:
        lOut.append("%s=" % s)
    file(templ_file, "wt").write("\n".join(lOut))

def read_strings(fname):
    lOut = []
    text = file(fname).read()
    for s in pattern.findall(text):
        lOut.append(s)
    return lOut

def i18n(templ_file):
    lOut = []
    for root, dirs, files in os.walk('./'):
        for name in files:
            if fnmatch.fnmatch(name, "*.lua"):
                fname = os.path.join(root, name)
                lOut.extend(read_strings(fname))
    gen_template(templ_file, lOut)
    
i18n("./locale/template.txt")
