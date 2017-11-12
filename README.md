Waabanang Lee Hermes, no partner

1. Planning - see sketch1.png, sketch2.png, sketch2.png

sketch1.png shows my initial thoughts for this visualization. At this stage in design, I didn't want to consider a bunch of different items. My main goal here was establishing the axis manipulation features I wanted to include in my visualization. Namely I wanted the user to hide axes and for the item to be drawn appropriately in response (show/hide), and allow the user to switch the places of axes (swap).

In sketch2.png I wanted to show my thoughts on handling the display of many items. I decided that a legend of some sort and color coding would be necessary in order to keep track of items (at this point I didn't realize that all the datasets were bigger than 400 items). I was worried a little worried about this view being too cluttered, but had some features in mind to mitigate that.

sketch3.png shows the features I wanted to include to improve readability. Namely this is the 'single view' mode and scrolling for the axes. In single-view mode, in contrast to the normal 'multi-view' mode, only one item is colors, but the other items are displayed in a semi-transparent gray. This would allow the user to compare a single item against the general trends. The scrolling was just because I had imagined that there'd be a lot of axes and scrolling would be important to navigation.  

2. Product

Features and Interactions
* Color coding - finished1.png
The color coding of items is random and rainbow. This isn't really the best for being able to separate the items from each other. Sometimes the colors are a little too close to the background. However despite these obvious drawbacks color coding is still useful - especially if you're only displaying a few items.

* Show/hide item(s) - finished2.png
All items can be hidden or shown with the buttons above the legend. Additionally each item can have its visibly toggled individually by simply clicking the item name on the legend. This allows for the user to filter items, at least somewhat.

* Show/hide axis - finished3.png
This works exactly like I planned it to! Press the button underneath an axis label and it'll hide the axis. Items will be drawn as though that axis wasn't there, and the button will become empty. Pretty the button again to show the axis.

* Swap axes - finished4.png & finished5.png
Just below the hide/show button is another empty button. When you press this button it'll fill yellow. When you press another button in this row, the two axes under those labels will change places.

Changes from Prototype
The features in sketch3.png didn't quite make it into the app. I thought they were really to improve readability, but I kind of came up with some alternative, easier to implement features that would be similar. A lot of my implementation was the most 'quick and dirty' version of the features I wanted. I thought Processing would provide more utility than it really did. For instance buttons needed to be implemented by taking advantage of the mouse position and mouseClicked() callback. This level of detail work wasn't totally unexpected, but slowed development nonetheless (lot of time spent making sure click areas were correct).

Critique and Conclusions
The two goals were filtering across multiple attributes, and rearranging axis. As far as I can tell the later is pretty explicitly implemented in my visualization. The former however is a little shakier. Really what I added in in terms of filtering is the ability to hide and show items, and axes. Personally I think this fits the bill, it allows you to look at smaller subsets of the data at your discretion. However it's not based on item's attributes, I didn't implement any sort of sorting, or filtering that allow you to browse items in terms of attributes.

If I had some more time I'd look more into filtering methods. I think that my first choice of interaction here would be limiting the displayed items to a subset based on an attribute quarter. This would be a drop-down menu attached to each axis that would show. From this menu the user could select which subset of items they'd like to view; the top 25% of item on that axis, the top 50%, the least 50%, and the least 25%.

Additionally there's elements of the visualization as is that could use some attention. First I'd like to implement the single view mode discussed in prototype and sketches. This seems like a feature that would be important to navigation and understanding the dataset as a whole, especially in how it allows you to compare trends to a single item. I'd also like to resolve the color situation more elegantly. Because of the sheer number of items, getting perceptually different colors for each one seems kind of like an impossibility, so perhaps I'd want to color code more based on attributes in the multi-view rather than using color as an identifier. Of course this means that items would have to be uniquely identified through some other means, perhaps through labels and highlighting? The final feature I'd want to include is more animation. Right now things disappear instantly when hidden, and move instantly when swapped. I think it'd be much more legible and aesthetically pleasing with transition frames. It's a detail that's often thought of secondary, but seems important to me.
