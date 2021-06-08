 
+++

title = "Guide for writing markdown slides"
description = "A Hugo theme for creating Reveal.js presentations"
outputs = ["Reveal"]
aliases = [
    "/guide/"
]

+++


# Short guide to Markdown slides

---

# Headers

# H1
## H2
### H3
#### H4

---

# Text

normal text

`inline code`

*italic*

**bold**

**_emphasized_**

*__emphasized alternative__*

~~strikethrough~~

[link](http://www.google.com)

---

# Lists and enums

1. First ordered list item
1. Another item
    * Unordered sub-list.
    * with two items
        * another sublist
            1. With a sub-enum
            1. yay!
1. Actual numbers don't matter, just that it's a number
  1. Ordered sub-list
1. And another item.

---

# Inline images

![Alternative text](https://upload.wikimedia.org/wikipedia/it/6/6c/Scavolino_innevata.jpg)

---

## Fallback to shortcodes for resizing

Autoresize specifying

* `max-w` (percent of parent element width) and/or `max-h` (percent of viewport height) as max sizes , and
* `width` and/or `height` as *exact* sizes (as percent of viewport size)

{{< image src="https://upload.wikimedia.org/wikipedia/it/6/6c/Scavolino_innevata.jpg" max-h="20">}}

---

## Low res, plain markdown

![](https://upload.wikimedia.org/wikipedia/it/thumb/6/6c/Scavolino_innevata.jpg/260px-Scavolino_innevata.jpg)

---

## Hi res, plain markdown

![](https://upload.wikimedia.org/wikipedia/it/6/6c/Scavolino_innevata.jpg)

---

## Low res, default

{{< image src="https://upload.wikimedia.org/wikipedia/it/thumb/6/6c/Scavolino_innevata.jpg/260px-Scavolino_innevata.jpg" >}}

---

## Hi res, default

{{< image src="https://upload.wikimedia.org/wikipedia/it/6/6c/Scavolino_innevata.jpg" >}}

---

## Low res, enlarged horizontally

{{< image src="https://upload.wikimedia.org/wikipedia/it/thumb/6/6c/Scavolino_innevata.jpg/260px-Scavolino_innevata.jpg" width="100">}}

---

## Low res, enlarged vertically

{{< image src="https://upload.wikimedia.org/wikipedia/it/thumb/6/6c/Scavolino_innevata.jpg/260px-Scavolino_innevata.jpg" height="100">}}

---

## Hi res, reduced horizontally

{{< image src="https://upload.wikimedia.org/wikipedia/it/6/6c/Scavolino_innevata.jpg" width="50">}}

---

## Hi res, reduced vertically

{{< image src="https://upload.wikimedia.org/wikipedia/it/6/6c/Scavolino_innevata.jpg" height="50">}}

---

## Hi res, reducing maximum expansion horizontally

{{< image src="https://upload.wikimedia.org/wikipedia/it/6/6c/Scavolino_innevata.jpg" max-w="50">}}

---

## Hi res, reducing maximum expansion vertically

{{< image src="https://upload.wikimedia.org/wikipedia/it/6/6c/Scavolino_innevata.jpg" max-h="50">}}

---

{{< slide background-image="https://upload.wikimedia.org/wikipedia/it/6/6c/Scavolino_innevata.jpg" >}}

# Large images as background
## (May affect printing)

---

{{< slide background-image="https://upload.wikimedia.org/wikipedia/it/6/6c/Scavolino_innevata.jpg" state="blur-animation-light"  transition="fade-in fade-out" >}}

# Also available with blur and custom transitions
## (May affect printing)

---

# $$\LaTeX{}$$


Inline equations like $E=mc^2$

$$\frac{n!}{k!(n-k)!} = \binom{n}{k}$$  

---

# Code snippets


```kotlin
val x = pippo
```

```go
package main
 
import "fmt"
 
func main() {
    fmt.Println("Hello world!")
}
```

---

# Tables

Colons can be used to align columns.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the 
raw Markdown line up prettily. You can also use inline Markdown.

---

# Quotes

> Multiple
> lines
> of
> a
> single
> quote
> get
> joined

> Very long one liners of Markdown text automatically get broken into a multiline quotation, which is then rendered in the slides.

---

# Fragments

* {{< frag c="pluto" >}}
* {{< frag c="pluto" >}}
* {{< frag c="pluto" >}}

---

# Graphs via Gravizo

{{< gravizo "Example Gravizo graph" >}}
  digraph G {
    aize ="4,4";
    main [shape=box];
    main -> parse [weight=8];
    parse -> execute;
    main -> init [style=dotted];
    main -> cleanup;
    execute -> { make_string; printf}
    init -> make_string;
    edge [color=red];
    main -> printf [style=bold,label="100 times"];
    make_string [label="make a string"];
    node [shape=box,style=filled,color=".7 .3 1.0"];
    execute -> compare;
  }
{{< /gravizo >}}

