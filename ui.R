# START
shinyUI(
  tagList(
  tags$link(rel = "stylesheet", type = "text/css", href = "my_style.css"),
navbarPage(id = "tabs",
  theme = shinytheme("cosmo"),
  title = p(strong("REM"),style=paste0("color:",c_1)),
  windowTitle = "REM",
  footer = div(id="site-footer"),
  tabPanel(
    'Sign-In', icon = icon("user")
    , sidebarLayout(
      sidebarPanel(
      textInput('ou_email',
                  'Company Email',
                  # value = 'noahpollock@mycompany.com', # predefined value for testing
                  placeholder = 'example@mycompany.com')
      , actionButton("sign_in", "Sign-In / Sign-Up")
      , br(),br()
      , box(width = 12,collapsible = FALSE, collapsed = FALSE,
            title = "Site Administrator",
            p(strong("Name: "),"Noah Pollock"),
            p(strong("Email: "),"noahpollock@mycompany.com"))
      , box(width = 12,collapsible = FALSE, collapsed = FALSE,
            title = "Data Policy",
            p("The data entered on this site is retained in a private Google Sheet and is 
            used exclusively for providing access to and maintaining the full functionality of this site. 
            Data entered is never deliberately shared or distributed beyond individual users gaining access. 
            Please contact the Site Administrator for more information or to request that 
            your data be deleted."))
    )
    # , mainPanel(img(src='ou_tower_lg.png'
    #                 ,alt="Logo for the REM app."
    #                 ,align = "right"
    #                 ,style="border-radius: 8px;
    #                   max-width: 100%;
    #                   height: auto;"))
    , mainPanel(splitLayout(div(p("Random.",br()
                    ,"Employee.",br()
                    ,"Meetup.",br(),style=paste0("color:",c_1,";font-size: 200%; font-wieght: bold;"))
                    ,p("Mix. Mingle.",style=paste0("color:",c_1,";"))
                    ,align = "left")
                    ,p(icon("connectdevelop",class = "fa-10x"))))
    )),

  tabPanel(
    'Schedule', icon = icon("calendar")
    , tabsetPanel(
        tabPanel("Set Availabilty"
      , fluidPage(
         sidebarLayout(
           sidebarPanel(width=3
            , selectInput("timeslot", label="Time Slot",
                         choices = list("11:00 - 12:00" = 11, "12:00 - 1:00" = 12, "1:00 - 2:00" = 13), 
                         selected = 12)
            , p("Choose all the days that you are available to meet other OU faculty or staff during the selected Time Slot.",
                " Be sure to click Submit to save your selections!")
             # , textOutput("current_time")
             # , selectInput('easy_workdays',
             #             'Weekday(s)',
             #             multiple=TRUE,
             #             workdays)
             # , verbatimTextOutput('out_easy_workdays')
             # , verbatimTextOutput("send_to_gs")
             # , verbatimTextOutput("dt_select_test")
             # , verbatimTextOutput("dt_select_test2")
             # , submitButton("Submit") # delays ALL inputs on page until press
            # , verbatimTextOutput("user_email")
             , actionButton("submit_sched", "Submit")
           
           ),
           
           mainPanel(
             DT::dataTableOutput("calendar_dt")
             , br(), br()
           )
         )
      )),
      tabPanel("See My Scheduled Meetups", 
               fluidPage(fluidRow(
                 p("This feature is still in development. 
                   The schedule presented is not yet tied to your identified availability. 
                   Eventually, meetups will only be schedule within Time Slots that you identified as being available."),
                 uiOutput("scheduled_meets"))))
  )),

  tabPanel(
    'Analytics', icon = icon("bar-chart")
    , h1("Days with Popular Availability")
    , p("This table showcases days that have proportionately more or less employees indicating that
        they're availabe.")
    , DT::dataTableOutput("analytics_dt")
    # , uiOutput("date_select")
    ),
  tabPanel(
    'About/Help', icon = icon("question-circle"),
    fluidPage(
      fluidRow(
    h1("What is this?")
    , p("This web application helps you connect with other employees at ",organization,"."
        ," By identifying your general availability over the next few months, you will be randomly paired
        with another employee to meetup on a specific day based exclusively upon shared availability.")
    , h3("Conversation Starters")
    , tags$ul(
      tags$li(tags$b("The Basics:")," How long have you worked here? What do you like to do outside of work?")
      , tags$li(tags$b("More Detailed:")," What are some exciting projects you've worked on?")
      , tags$li(tags$b("Advanced Topics")," Do you have an long term goals?")
    )
    )))
  , tabPanel('Sign-Out',value = "out",icon = icon("sign-out"),tags$style("float: right;"))
)
  ))
