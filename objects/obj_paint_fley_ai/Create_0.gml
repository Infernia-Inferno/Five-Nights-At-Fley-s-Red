image_alpha = 0;
groob = 17 * 60 * random_range(0.7,1.3) * (1+(25-ai)/10);
groobiness = groob;
//groob is charge, when it reaches 0 scouttf2 is set to 761 (12.69s) and decreases every frame after that
//groobiness is maximum charge
//lock is a state that is applied whenever in cams, preventing ms paint fley from advancing further stages, decreased by 1 every frame
//Charging will be activated when you look at hall b when groob is 0 or when scouttf2 reaches 0
//Arcade is whether or not ms paint fley is in the arcade
//Foxymoment is the progress of running down the hall
