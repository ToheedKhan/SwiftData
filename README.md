# SwiftData
Creating data Model
Model Container and context
Previewing Sample Data
Saving Data
Deleting Data




a model describes what our data looks like and specifies how it might relate to other models.


Each of the five parts has its own responsibilities.
Data model.
The first main component is the data model.
This model describes and represents the actual data we want to store and work with.
If our application does not have a model, then Swift data will not know how to store anything.
Model container.
The model container is responsible for creating and managing the actual database file used for all storage
needs with Swift data.
Having said that, the model container reads model data and loads data from the persistent store.
This component is created on the app startup.
Model configuration.
The model configuration determines how and where data is stored.
It could use the permanent storage of the device, but the data might be stored in memory or using any
CloudKit container.
We can also configure whether automatic data saving should be enabled or not.
Model context.
The model context tracks all objects that have been created, modified, and deleted in the device memory
so they can be permanently saved to the model container at a later point.
It also provides tools to undo or commit changes to the persistent store.
The view.
The SwiftUI view will use a property wrapper called query to retrieve data from the model context that
was added to the environment.
The request is passed from the view to the model context and information is synced.
Finally, this is where users can create data or make changes using the screens user interface.
In summary, the model represents the data.
The model container stores data entities.
The model context facilitates interactions with the data, and the model configuration sets up and defines
the data model.


@Model
model macro tells swift data that we want to be able to load and
save any wish objects using a Swift data database, and this model will convert our Swift class into
a stored model that is managed by Swift data.
Additionally, this will introduce other useful functionality behind the scenes, enabling Swift data
to recognize when we modify specific properties within a wish object and automatically ensure those
changes are saved.

model macro converts a Swift class into a stored model managed by Swift data.

Model Container


how to connect Swift data in Swift UI.
This process has exactly three steps.
First, we must open the wish list app Swift file and import Swift data into the main app.

Step two.
After that, we need to add a new modifier to the window group.

This model container creates and sets up a storage for the wish object.
Also, it enables access to the storage inside the window group which is the entire app.

And finally, this container reads the Swift model to understand how the data objects should be saved.
Step three please import the Swift data framework at the top in the content view file.

The model container modifier we added to content view inserts a model context into the SwiftUI environment,
and this model context is accessible to all views under the container.
Also, the model context provides a connection between the view and the model container so that we can
fetch, insert, and delete items in the container.


@Query Macro
Querying Swift data objects.

this query macro will read all wish objects being managed by Swift data.
Also, this query is really smart.
It will load all the wishes immediately when the view appears, and it will also watch the database
for changes so that whenever any wish object gets added, deleted or changed, the wishes property will
also be updated.



Swift UI fundamantal

SwiftUI is a modern UI framework for building user interfaces across all Apple platforms. Below are the fundamental concepts of SwiftUI:
	1	Declarative Syntax: SwiftUI uses a declarative approach, allowing you to describe what the UI should look like based on its current state rather than specifying how to create and update the UI. This makes the code more readable and easier to manage.
	2	Views and Modifiers: A SwiftUI app is built using views, which are lightweight and composable building blocks. You can modify views using modifiers, which allow you to change properties like color, font, and layout in a chainable manner.
	3	State Management: SwiftUI introduces several property wrappers (like @State, @Binding, @Environment, etc.) for managing state within your app. This helps reflect changes in data directly in the UI without needing to manually refresh the views.
	4	Layout System: SwiftUI provides a flexible layout system that includes various layout containers such as VStack, HStack, and ZStack, which allow you to arrange elements vertically, horizontally, or in layers.
	5	Data Binding: SwiftUI emphasizes data-driven designs, allowing views to automatically update when the underlying data changes. This is achieved through binding mechanisms that connect your data model to your views.
	6	Navigation and Presentation: SwiftUI includes features for easy navigation between different views and presenting modals, sheets, and alerts. This simplifies building multi-screen applications.
	7	Integration with Swift Data: SwiftUI can easily integrate with Swift Data to handle data persistence. For example, you can create a mobile application that stores and retrieves data like user preferences or content dynamically.
These fundamentals make SwiftUI a powerful tool for developers who want to create responsive and visually appealing applications using a modern and efficient coding style. If you're interested in applying these concepts practically, the course offers hands-on tutorials and projects.
