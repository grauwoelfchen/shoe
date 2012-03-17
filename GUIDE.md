# Guide

## sbsm

State Based Session Management

### event routing

You can create event routings in your Validator class (extend SBSM::Validator).

```
EVENTS = [
  :home,
  :search,
  ...
]
```
Then you can create :home and :search events in your State class.  

### url structure

* http://HOSTNAME/LANG/FLAVOR/EVENT/KEY/VALUE/KEY/VALUE/...

### flavor

You can change lookandfeel as flavor.

## htmlgrid

### HtmlGrid::Composite

#### constants

```
 Name              | Class   | Default   | Description
------------------ | ------- | --------- | --------------------------------
 COLSPAN_MAP       |    Hash |        {} |
 COMPONENT_CSS_MAP |    Hash |        {} | css class for each grid
 DEFAULT_CLASS     |       * | InputText | default class of each COMPONENTS
 VERTICAL          | Boolean |      true | 
```

### HtmlGrid::Value


## odba

### find query

odba has usefull find methods.  
These method come from *define_method*.

* include ODBA::Persistable
* call odba_index

```
odba_index :title
```

Your model has **find_by_title**


see ODBA::Persistable

