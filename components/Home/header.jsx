import React from 'react'
import Jello from 'react-reveal/Jello';
import {Header,HeaderImg,Signup} from './styles'
import styled from 'styled-components'
export default function header() {
    return (
        <Header style={{width:'100%',height:'fit-content',display:'flex',flexDirection:'column',alignItems:'center'}}>
               <HeaderImg>
                   {/* <Jello> */}
                    <Img>
                    <img src="/imageasset/heading.png" width="100%" height="auto"></img>
                    </Img>
                   {/* </Jello> */}
                   <Signup><a href="https://www.codechef.com/college-chapter/member" target="_blank">SIGN UP</a></Signup>
               </HeaderImg>
        </Header>
    );
}

const Img = styled.div`
    width:75%;
    @media (max-width: 767px) {
        width:90%;
    }
`;