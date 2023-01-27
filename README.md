# Sytac iOS assignment | Movies


In the assignment, I tried to show how architectural patterns **MVVM** and **Clean Architecture** can be applied.

After grouping all layers, I splitted the app into 3 layers: **Presentation, Domain and Data layers.**

The image show how is dependency between the layers.

![Clean Architecture Graph](https://miro.medium.com/v2/resize:fit:720/format:webp/1*MzkbfQsYb0wTBFeqplRoKg.png)

**Domain Layer (Business logic)** (without dependencies to other layers, it is totally isolated). It contains *Entities(Business Models), Use Cases, and Repository Interfaces.*

**Presentation Layer** contains *UI (UIViewControllers or SwiftUI Views).* Views are coordinated by *ViewModels (Presenters) which execute one or many Use Cases.* Presentation Layer depends only on the Domain Layer.

**Data Layer** contains *Repository Implementations and one or many Data Sources.*


### Data Flow
1. **View(UI)** calls method from **ViewModel** (Presenter).
2. **ViewModel** executes **Use Case**.
3. **Use Case** combines data from *Repositories*.
4. Each **Repository** returns data from a Remote Data (Network).
5. Information flows back to the **View(UI)** where we display the list of items.


### Testing
I covered **Domain and Data Layer** and most important parts in **Presentation layer** (ViewModel).


### Questions
[Answers](https://github.com/Sytac-DevCase/iOS-HussamElsadany/blob/develop/Questions.md)
