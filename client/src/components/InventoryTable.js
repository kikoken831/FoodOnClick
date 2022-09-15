import React, { useState, useEffect } from "react";
import { DataTable } from "primereact/datatable";
import { Column } from "primereact/column";
import { Button } from "primereact/button";
import { Toolbar } from "primereact/toolbar";
import API_URL from "./common/APIurl";

const InventoryTable = () => {
  const [inventory, setInventory] = useState([]);
  const [first, setFirst] = useState(0);
  useEffect(() => {
    fetch(`${API_URL}/api/home/kitchen`).then((response) => {
      response.json().then((data) => {
        console.log(data);
        setInventory(data);
      });
    });
  }, []);

  let emptyItem = {
    name : "",
    unit : "",
    qty : 0
  };


  const actionBodyTemplate = (rowData) => {
    return (
      <React.Fragment>
        <Button
          icon="pi pi-pencil"
          className="p-button-rounded p-button-primary mr-2"
        />
        <Button
          icon="pi pi-trash"
          className="p-button-rounded p-button-danger"
        />
      </React.Fragment>
    );
  };
  const leftToolbarTemplate = () => {
    return (
        <React.Fragment>
            <Button label="New" icon="pi pi-plus" className="p-button-primary mr-2" onClick={() => {console.log("clicked new");}} />

        </React.Fragment>
    )
}
  return (
    <>
      <div className="card mt-1">
        <Toolbar
          className="mb-0 p-2"
          left={leftToolbarTemplate}
        ></Toolbar>
        <DataTable value={inventory} className="rounded-5" paginator rows={10} first={first} onPage={(e) => setFirst(e.first)}>
          {/* <Column field="id" header="ID" style={{ width: "3rem" }} sortable></Column> */}
          <Column
            field="name"
            header="Name"
            sortable
            style={{ width: "40rem" }}
          ></Column>
          <Column
            align={"right"}
            field="unit"
            header="Unit"
            style={{ width: "1rem" }}
          ></Column>
          <Column
            align={"right"}
            field="qty"
            header="Quantity"
            style={{ width: "3rem" }}
          ></Column>
          <Column
            header="Action"
            align={"right"}
            body={actionBodyTemplate}
            exportable={false}
            style={{ width: "10rem" }}
          ></Column>
        </DataTable>
      </div>
    </>
  );
};

export default InventoryTable;
