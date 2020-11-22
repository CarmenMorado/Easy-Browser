# Easy-Browser
100 Days of Swift (Project 4) In this project, I learned how to build a simple browser using WebKit. I learned about WKWebView, action sheets, UIProgressView,
key-value observing, and more. The app first opens with a table view that has the title of "Websites" and two websites (https://www.hackingwithswift.com/ and 
https://www.apple.com/) listed in seperate cells. When either link is clicked, the corresponding webpage will be loaded using WKWebView. There's a toolbar items 
located at the bottom of the screen that contains a progress button (where key-value observing and UIProgressView became handy) and a refresh, backward, and forward
button. There is a right bar button item named "Open" that gives users the option to switch between the two websites. In addition, an alert pops up if the user clicks on an URL that isn't allowed.

I completed the following (part 3) challenges: 
-If users try to visit a URL that isn’t allowed, show an alert saying it’s blocked.
-Try making two new toolbar items with the titles Back and Forward. You should make them use webView.goBack and webView.goForward.
-For more of a challenge, try changing the initial view controller to a table view like in project 1, where users can choose their website from a list rather than 
just having the first in the array loaded up front.

![ezgif-3-9d28fea93cdd](https://user-images.githubusercontent.com/42749527/99892903-38f85b80-2c48-11eb-8c5f-5ca106072827.gif)
