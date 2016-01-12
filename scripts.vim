if did_filetype()
    finish
endif
if getline(1) =~# '^#!.*/bin/env\s\+node\>'
    setfiletype javascript
elseif getline(1) =~# '^#!.*/bin/env\s\+python\>'
    setfiletype python
elseif getline(1) =~# '^#!.*/bin/env\s\+ruby\>'
    setfiletype ruby
elseif getline(1) =~# '^http.*'
    setfiletype python
endif

