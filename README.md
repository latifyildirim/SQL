# The Structured Query Language (SQL) 
<hr>
<hr>

### Index

* [Kurulum](#kurulum)
* [Yapılandırma](#yapılandırma)


<hr>

## Kurulum


##### Bu komutla Sema olusturuz
```
$ CREATE SCHEMA "alanparadise/nw";
```
##### Tabloyu siler:
```
$ DROP TABLE IF EXISTS "alanparadise/nw"."items";
```
##### Tablo Yaratiriz:
```
$ CREATE TABLE "alanparadise/nw"."items"
        (
        itemID    INT         NOT NULL ,
        itemcode  VARCHAR(5)  NULL,
        itemname  VARCHAR(40) NOT NULL DEFAULT ' ',
        quantity  INT         NOT NULL DEFAULT 0,
        price     REAL        NOT NULL DEFAULT 0
        );
```
#####
```

```


