<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Library ERD</title>
    <style type="text/css">
      body {
        margin: 5%;
      }

      code {
        font-size: 1rem;
      }

      pre code {
        background-color: #eee;
        border: 1px solid #999;
        display: block;
        padding: 0 1rem;
        width: 50rem;
      }
    </style>
  </head>
  <body>
    <canvas id="er-diagram"></canvas>

    <pre>
      <code id="nomnoml-source">
#arrowSize: 0.8
#zoom: 1.2

[Category |
  name: varchar(255)
]

[Categorization |
  category_id: int
  book_id: int
]

[Category]->[Categorization]
[Book]->[Categorization]

[Book |
  title: varchar(255)
  author: varchar(255)
  year: int
]

[Checkout |
  book_id: int
  reader_id: int
]

[Book]->[Checkout]
[Reader]->[Checkout]

[Reader |
  full_name: varchar(255)
  email: varchar(255)
  phone_number: varchar(255)
]
      </code>
    </pre>
  </body>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/dagre/0.8.5/dagre.min.js" 
    integrity="sha256-YuuXh8z9vfQUjU2Z0x2/nuR3Dq/ugeY311m1KqwizVE=" 
    crossorigin="anonymous">
  </script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/nomnoml/0.6.2/nomnoml.min.js" 
    integrity="sha256-kLHwcrWU9s2K4q5V1tiRZpnjBsVDJEXS4fEAuOfGa6Y=" 
    crossorigin="anonymous">
  </script>

  <script>
    var canvas = document.getElementById('er-diagram');
    var source = document.getElementById('nomnoml-source').innerText;
    nomnoml.draw(canvas, source);
  </script>
</html>

