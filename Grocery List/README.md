# SwiftData
Swift Data is a powerful framework that works in conjunction with SwiftUI for managing data in your applications. Here are the key fundamentals to understand:
	1	Data Model: The data model describes the structure of the information you want to store. It includes the properties and relationships of your data objects. Without a proper data model, Swift Data cannot function effectively.
	2	Model Container: This component handles the creation and management of the database used for storage. It initializes when your application starts and is responsible for reading and writing data from the persistent store.
	3	Model Configuration: This determines how and where your data is stored. You can configure it to use device storage, memory, or cloud storage solutions, depending on your app's requirements.
	4	Model Context: The model context keeps track of all objects that have been created, modified, or deleted in memory. This allows for efficient management of the data lifecycle within your app.
	5	Data Flow: Understanding how data flows in Swift Data is crucial for effective application design. It involves the interaction between the data model, model container, and model context.
In practical applications, such as building a mobile app with Swift Data, you can create a UI form to gather user input, store it in the database, retrieve and display it using custom list layouts, and validate user entries to ensure data integrity. This process helps ensure a robust and user-friendly app experience.
These fundamentals set the foundation for more advanced topics and coding practices in the upcoming sections of the course. If you're interested in deeper examples and hands-on coding, the course provides tutorials that will guide you through these concepts step by step.


safe areas help us place our views within the visible portion of the overall interface.


What is Typekit?
Typekit makes it easy to teach people about a brand new feature in our app, help them discover a hidden
feature, or demonstrate faster ways to accomplish a task.

We use Typekit to display contextual tips that highlight new, interesting, or unused features that
people have yet to discover.
We also use the Tip protocol to define the tip content and the conditions under which it appears.
Then, using the tip view, we draw attention to new features.



As we design tips for our app, we must ensure we don't overwhelm users.
We should use tips sparingly to highlight non-obvious features people have yet to discover.
Similarly, we must avoid displaying tips each time someone uses our app.
As you know, tips can become distracting when they appear unnecessarily.
Finally, we must not use tips for advertising and promotion purposes.
Additionally, Typekit provides customizable styles.
It offers two styles that we can choose to match the look and feel of our app.
We can use a popover view to show a tip that appears over your app's UI, and even have it point directly
to a button or other element.
Also, we can use an inline view to fit within the existing UI without blocking any elements.
