<style>
.small-code pre code {
  font-size: 1em;
}
</style>

Let's Code - Week 13
========================================================
author: Adrien ROUX
date: April, 2017
autosize: true

Shiny dashboard (1/.)
========================================================
class: small-code

**shinydashboard** is a shiny framework dedicated to *dashboard*: <http://rstudio.github.io/shinydashboard/>


```r
if(interactive()) {
  install.packages("shinydashboard")
}
```

A **dashboard** is a user interface that, somewhat resembling an *automobile*'s dashboard, organizes and presents info in a way that is easy to read (self-explanatory). However, a computer dashboard is expected to be more interactive than an automobile dashboard. To some extent, most graphical user interfaces (GUIs) are dashboards. 

To understand how a dashboard is working, we first recall that shinydashboard is based on a shiny UI and relates to the HTML of a web page produced by shiny commands like: **textInput** or **sidebarPanel**.

The **shinydashboard** package provides a set of functions designed to create HTML that will generate a dashboard.

Shiny dashboard : The structure (1/.)
========================================================
class: small-code

The **dashboardPage()** function - to be compared with **fluidpage()** - expects 3 components: 

* a header, 
* a sidebar, 
* a body.


```r
if(interactive()){
  dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody()
  )
}
```

For more complicated apps, it is advised to split the code:


```r
if(interactive()){
  header <- dashboardHeader()
  sidebar <- dashboardSidebar()
  body <- dashboardBody()
  
  dashboardPage(header, sidebar, body)
}
```

Shiny dashboard : The Header (1/.)
========================================================
class: small-code

A header can have a *title* and *dropdown* menus. Here's an example:


```r
if(interactive()){
  dashboardHeader(title = "My Dashboard")  
}
```

The header can be disable by setting *disable* argument to TRUE. Title width can be adjusted to your convenience. unit is in pixel.

*Dropdown* menus can be added for :
* sending messages, 
* sending notifications,
* following tasks

This is a rather advanced design for dashboard. See <https://rdrr.io/cran/shinydashboard/man/dashboardHeader.html> for more details.


Shiny dashboard : The Sidebar (1/.)
========================================================
class: small-code

A sidebar is typically used for quick navigation. It can contain menu items that behave like tabs in a *tabPanel*, as well as Shiny inputs, like sliders and text inputs.


```r
if(interactive()){
  ## ui.R ##
  sidebar <- dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", icon = icon("th"), tabName = "widgets",
               badgeLabel = "new", badgeColor = "green")
    )
  )
  
  body <- dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              h2("Dashboard tab content")
      ),
      
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
  
}
```

Shiny dashboard : The body (1/.)
========================================================
class: small-code

The body of a dashboard page can contain any regular Shiny content. However, if you’re creating a dashboard you’ll likely want to make something that’s more structured. The basic building block of most dashboards is a **box**. Boxes in turn can contain any content.

**Boxes** are the main building blocks of dashboard pages. A **basic box** can be created with the **box()** function, and the contents of the box can be (almost) any Shiny UI content.


```r
if(interactive()){
  # This is just the body component of a dashboard
  dashboardBody(
    fluidRow(
      box(plotOutput("plot1")),
      
      box(
        "Box content here", br(), "More box content",
        sliderInput("slider", "Slider input:", 1, 100, 50),
        textInput("text", "Text input:")
      )
    )
  )
}
```

Shiny dashboard : Boxes (1/.)
========================================================
class: small-code

Boxes can have **titles** and header **bar colors** with the title and status options. The different possible statuses are shown here.

You can have solid headers with *solidHeader=TRUE*, and display a button in the upper right that will collapse the box with *collapsible=TRUE*.


```r
if(interactive()){
  dashboardBody(
    fluidRow(
      box(
        title = "Histogram", status = "primary", solidHeader = TRUE,
        collapsible = TRUE,
        plotOutput("plot3", height = 250)
      ),
      
      box(
        title = "Inputs", status = "warning", solidHeader = TRUE,
        "Box content here", br(), "More box content",
        sliderInput("slider", "Slider input:", 1, 100, 50),
        textInput("text", "Text input:")
      )
    )
  )
}
```

Shiny dashboard : further Boxes (2/.)
========================================================
class: small-code

* tabBox: If you want a box to have tabs for displaying different sets of content.
* infoBox: There is a special kind of box that is used for displaying simple numeric or text values.
* valueBox: are similar to infoBoxes, but have a somewhat different appearance.

Some boxes can be static and some can be dynamic. Take a look at the example: 


```r
if(interactive()){
  body <- dashboardBody(
    fluidRow(
      # A static valueBox
      valueBox(10 * 2, "New Orders", icon = icon("credit-card")),
      
      # Dynamic valueBoxes
      valueBoxOutput("progressBox"),
      
      valueBoxOutput("approvalBox")
    ),
    fluidRow(
      # Clicking this will increment the progress amount
      box(width = 4, actionButton("count", "Increment progress"))
    )
  )
}
```

Shiny dashboard : Layouts (1/.)
========================================================
class: small-code

The body can be treated as a region divided in to 12 columns of equal width, and any number of rows, of variable height. When you place a box (or other item) in the grid, you can specify how many of the 12 columns you want it to occupy.

There are 2 ways of laying out boxes: with a row-based layout, or with a column-based layout.

**Row-based layout**

Boxes must go in a row created by **fluidRow()**. Rows have a grid width of 12, so a box with width=4 takes up one-third of the width, and a box with width=6 (the default) takes up half of the width.

The tops of the boxes in each row will be aligned, but the bottoms may not be – it depends on the content of each box.

Shiny dashboard : Layouts (2/.)
========================================================
class: small-code


```r
if(interactive()){
  body <- dashboardBody(
    fluidRow(
      box(title = "Box title", "Box content"),
      box(status = "warning", "Box content")
    ),
    
    fluidRow(
      box(
        title = "Title 1", width = 4, solidHeader = TRUE, status = "primary",
        "Box content"
      ),
      box(
        title = "Title 2", width = 4, solidHeader = TRUE,
        "Box content"
      ),
      box(
        title = "Title 1", width = 4, solidHeader = TRUE, status = "warning",
        "Box content"
      )
    ),
    
    fluidRow(
      box(
        width = 4, background = "black",
        "A box with a solid black background"
      ),
      box(
        title = "Title 5", width = 4, background = "light-blue",
        "A box with a solid light-blue background"
      ),
      box(
        title = "Title 6",width = 4, background = "maroon",
        "A box with a solid maroon background"
      )
    )
  )
}
```


Shiny dashboard : Layouts (3/.)
========================================================
class: small-code

**Column-based layout**:

With a column-based layout, you first create a column and then place boxes within those columns.


```r
if(interactive()) {
  body <- dashboardBody(
    fluidRow(
      column(width = 4,
             box(
               title = "Box title", width = NULL, status = "primary",
               "Box content"
             ),
             box(
               title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
               "Box content"
             ),
             box(
               width = NULL, background = "black",
               "A box with a solid black background"
             )
      ),
      
      column(width = 4,
             box(
               status = "warning", width = NULL,
               "Box content"
             )
      )
    )
  )
}
```

Shiny dashboard : Layouts (4/.)
========================================================
class: small-code

**Mixed row and column layout**:

It’s also possible to use a mix of rows and columns.
