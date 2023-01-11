![](https://upload.wikimedia.org/wikipedia/commons/9/9c/Dunder_Mifflin%2C_Inc.svg)

# Dunder Mifflin Warehouse

If the Dunder Mifflin Warehouse had an In and Out system would it be done via Event Sourcing? I don't know but let's try to create something 🤣

## Business Domain

Packages are coming in and out of the warehouse. Each time they change their location they are scanned and then marked by a personel.
Yet, sometimes they are in the wrong place. What should happen then? We know where the package is, but if the flow went somehow wrong.
We should raise an issue and notify right people, maybe create an investigation task.
