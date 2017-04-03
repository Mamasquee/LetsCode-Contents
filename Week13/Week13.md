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


Shiny dashboard : The structure (1/.)
========================================================
class: small-code

To understand how a dashboard is working, we first recall that shinydashboard is based on a shiny UI and relates to the HTML of a web page produced by shiny commands like: **textInput** or **sidebarPanel**.

The **shinydashboard** package provides a set of functions designed to create HTML that will generate a dashboard.



Shiny dashboard : The structure (2/.)
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


Shiny dashboard : The structure (3/.)
========================================================
class: small-code

For more complicated apps, we advise you to split the code:


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


Shiny dashboard : The Sidebar (1/.)
========================================================
class: small-code




```r
if(interactive()){
  dashboardHeader(title = "My Dashboard")  
}
```