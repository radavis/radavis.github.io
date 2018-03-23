# ElectroKit

Web platform for releasing Electronics Kits. Models: Parts, Projects, Suppliers, Orders.

## Models

### Part

* manufacturer
* part_number
* description
* has_many :suppliers

### Project

* name
* created_by
* has_many :parts
* has_many :documents, examples: [bill_of_material, drawing, photo]

### Document

* type (determined by extension)
* belongs_to :project
