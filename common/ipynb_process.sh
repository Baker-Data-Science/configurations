echo "Converting file $1.html"
echo "Removing remove_cell and remove_inputs"

rm "$1.html"

jupyter nbconvert --to html "$1.ipynb" --TagRemovePreprocessor.remove_cell_tags remove_cell --TagRemovePreprocessor.remove_input_tags remove_input

wslview "$1.html"

echo "Complete"
