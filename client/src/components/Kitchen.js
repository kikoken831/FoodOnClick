import React, {useState, useEffect} from 'react'
import Nav from './Nav';
import Banner from './Banner';
import InventoryTable from './InventoryTable'


export const Kitchen = () => {
  return (
    <>
    <Nav></Nav>
    <Banner></Banner>
    <InventoryTable></InventoryTable>
    </>
  )
}
