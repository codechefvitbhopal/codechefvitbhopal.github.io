import React, {useRef,useEffect} from 'react'
import anime from 'animejs';
import {Header,HeaderImg,Signup} from './styles'
import styled from 'styled-components'
export default function header() {
    const signUpHoverAnimationStart = useRef(null);
    const signUpHoverAnimationEnd = useRef(null);
    useEffect(()=>{
        signUpHoverAnimationStart.current = anime({
            target:".signUpDiv",
            width:'100%',
            scale:{
                delay : 800,
                value : 1.5
            },
            duration : 1500
        });
        signUpHoverAnimationEnd.current = anime({
            target:".signUpDiv",
            width:'50%',
            scale:{
                delay : 800,
                value : 1
            },
            duration : 1500
        });
    },[]);
    return (
        <Header style={{width:'100%',height:'fit-content',display:'flex',flexDirection:'column',alignItems:'center'}}>
               <HeaderImg>
                   <Img>
                   <img src="/imageasset/heading.png" width="100%" height="auto"></img>
                   </Img>
                   <Signup className='signUpDiv' onMouseOver={()=>signUpHoverAnimationStart.current.restart()} onMouseOut={()=>signUpHoverAnimationEnd.current.restart()}><a href="https://www.codechef.com/college-chapter/member" target="_blank">SIGN UP</a></Signup>
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