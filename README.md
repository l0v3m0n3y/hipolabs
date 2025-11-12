# hipolabs
api for universities.hipolabs.com service for searching universities in your country
# Example
```nim
import asyncdispatch, hipolabs, json, strutils
let data = waitFor search_universities("country")
echo data
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
