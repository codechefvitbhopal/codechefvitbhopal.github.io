import React, { useState } from 'react'
import Flip from 'react-reveal/Flip';
import styled from 'styled-components'
import teamdata from "../../data/team.json"
import '../../styles/Home.module.css'
import Footer from '../../components/Footer/Footer';
import Teamdivi from '../../components/Teamdivision/teamdivi';

const Team=()=>{
    
   return (
      <>
  <div style={{display:'flex',justifyContent:'center'}}>
  <Heading>
  {/* <Flip left> */}
    <img src="/imageasset/Team.png" width="100%" height="auto"></img>
    {/* </Flip> */}
  </Heading>
  </div>
  {teamdata['teammember'].map((node) => (
     <Teamdivi key={node.category} {...node}/>
  ))}
  <div style={{marginBottom:'5rem'}}/>
   <Footer/>
   </> 
      )
};


const Heading=styled.div`
  width:550px;
  @media screen and (max-width:565px){
     width:270px;
 }
`;

export default Team;