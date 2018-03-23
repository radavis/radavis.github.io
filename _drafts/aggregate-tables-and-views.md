# Aggregate Tables

> Aggregate tables, in general, are simply database tables that contain
> aggregated values.

> An aggregate fact table is simply one that combines multiple rows of
> data, loses some detail and aggregates numerical values.

[source](http://searchdatamanagement.techtarget.com/answer/What-are-aggregate-tables-and-aggregate-fact-tables)

> An aggregate table coexists with the base fact table, and contains
> pre-aggregated measures built from the fact table.

[source](http://mondrian.pentaho.com/documentation/aggregate_tables.php)

## Data Granularity

The distinctive features of each row, and the frequency at which they are recorded. e.g. - customer, purchase date, product sold.

An example of data aggregation would be taking these facts, and summing the number of sales for a product in a given month.

## Views

A view is a named query, defined on top of "base tables."

[source](http://www.postgresqltutorial.com/postgresql-views/)

### Materialized Views

* Physically store data in a view table.
* At regular intervals, query base tables, update stored data in the view.

### Updatable Views

Which are somehow different from materialized views. Description TBD.

### Creating a View

```sql
CREATE VIEW name AS query;
```

### Update a View

```sql
CREATE OR REPLACE name AS query;
CREATE OR REPLACE VIEW name AS query;
ALTER VIEW name RENAME TO other_name;
```

### Destroy a View

```sql
DROP VIEW IF EXISTS name
```

## Exercise

> Recast a complicated ActiveRecord query as a simpler query on a view-backed model.

[source](https://dan.chak.org/enterprise-rails/chapter-11-view-backed-models/)

## SQL USING Keyword

> The USING clause is a shorthand that allows you to take advantage of the specific situation where both sides of the join use the same name for the joining column(s).

```sql
SELECT c1, c2, c3
FROM t1
JOIN t2 USING (c1)
JOIN t3 USING (c2)
```

 For example, joining t1 and t2 with USING (c1) produces the join condition ON T1.c1 = T2.c1

[source](https://www.postgresql.org/docs/9.2/static/queries-table-expressions.html)


## Resources

* [PostgreSQL Tutorial: Views](http://www.postgresqltutorial.com/postgresql-views/)
* [pentaho Mondrian Docs: Aggregate Tables](http://mondrian.pentaho.com/documentation/aggregate_tables.php)
* [TechTarget: Aggregate Tables](http://searchdatamanagement.techtarget.com/answer/What-are-aggregate-tables-and-aggregate-fact-tables)
* [Postgres views w/ Rails](http://blog.roberteshleman.com/2014/09/17/using-postgres-views-with-rails/)
