### MultiPugBomb

Your objective is to create an app that loads 100 pugs into a `CollectionViewController`. You will be using an awesome api created here at Flatiron that grabs one random pug for each call.

API : `http://pugme.herokuapp.com/random`

Once the api is called, the image must then be downloaded and added to the imageview. Make the imageView the width of the container. The design should look something like this.


### Note
Do not use Alamofire or SwiftyJSON or any third partner frameworks. They come with some build in multithreading which defeat the purpose of this lab. There are several ways to solve this problem but the objective is for it to load smoothly.

In addition some of the links are dead links which is a common feature on the internet. You must handle dealing with deadlinks so there are no empty imageViews. Handle this in any way you wish.

*Hint* You can use a placeholder image but feel free to use what you wish.

### Advanced

Included in this lab is a UIImage extension that will allow you to filter images. Filtering images is a long running process and you will need to think about how you want this to work. There are three filters available, choose the one you like best.

This app should allow a user to double tap on a cell and then swap out the image for a new filtered image.

*Hint* This may require a property on the cell that holds onto the UIImage. Ask an instructor if you are unsure.
