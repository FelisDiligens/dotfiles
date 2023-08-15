function make_ico
    echo "make_ico $argv[1]"
    set output_filename (string replace -r "\\.\\w+\$" ".ico" "$argv[1]")
    echo "output_filename $output_filename"
    if string match -q "*.svg" "$argv[1]"
        # "-background transparent":                  Keep transparency instead of making the background white
        # "-size 1024x1024":                          Tell ImageMagick to draw the vector image onto a 1024px wide canvas
        # "-gravity center -extent 1024x1024":        Extend the canvas to a square
        # "-define icon:auto-resize=256,64,48,32,16": ico files have multiple "layers", areas are multiple of 2
        # "${1%.*}.ico":                              replace the last file extension by ".ico"
        echo "svg"
        convert -background transparent -size 1024x1024 -gravity center -extent 1024x1024 "$argv[1]" -define icon:auto-resize=256,64,48,32,16 $output_filename
    else
        echo "something else"
        convert -background transparent -resize 1024x -gravity center -extent 1024x1024 "$argv[1]" -define icon:auto-resize=256,64,48,32,16 $output_filename
    end
end