import React, { useEffect } from "react";
import styled from "styled-components";
import Aos from "aos";
import "aos/dist/aos.css";
import StockerHomeImage from "../img/home.png";
import A from "../img/wony.png";
import B from "../img/como.png";
import C from "../img/koalakid.png";

import { GoMarkGithub } from "react-icons/go";
import { GrFacebook } from "react-icons/gr";
import { AiFillLinkedin } from "react-icons/ai";

const Container = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
  background: #fff;
  padding-top: 100px;
  margin-bottom: 150px;
`;

const Contents = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 1325px;

  @media screen and (min-width: 768px) and (max-width: 991px) {
    width: 700px;
  }

  @media screen and (max-width: 767px) {
    width: 90%;
  }
`;

const SplashDesc = styled.div`
  margin-left: 50px;
  width: 350px;
  font-weight: bold;
  color: #495057;
  @media screen and (max-width: 767px) {
    h2 {
      font-size: 1.25em;
    }
    p {
      font-size: 0.875rem;
    }
  }
`;

const Splah = styled.img`
  width: 300px;
  margin-right: 20px;
  @media screen and (max-width: 767px) {
    width: 150px;
  }
`;

const BackgroundStyles = styled.div`
  width: 100%;
  height: 150px;
  /* background: #4dabf7; */
  position: absolute;
  transform: translate(0, 270%);
  z-index: -1;
`;

const DeveloperDesc = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
`;

const LinkGroup = styled.div`
  display: flex;
  width: 150px;
  justify-content: space-around;
  align-items: center;
`;

const Developer = () => {
  useEffect(() => {
    Aos.init({ duration: 2000 });
  }, []);

  return (
    <Container>
      <Contents data-aos="zoom-in">
        <DeveloperDesc>
          <Splah src={A} />
          <h3>정원영</h3>
          <p>Home Screen</p>
          <p>Chart Design</p>
          <p>iOS dev</p>
          <LinkGroup>
            <GoMarkGithub fontSize={38} />
            <GrFacebook fontSize={32} />
            <AiFillLinkedin fontSize={40} />
          </LinkGroup>
        </DeveloperDesc>
        <DeveloperDesc>
          <Splah src={B} />
          <h3>김성진</h3>
          <p>Deep Learning</p>
          <p>Server</p>
          <p>Release</p>
          <LinkGroup>
            <GoMarkGithub fontSize={38} />
            <GrFacebook fontSize={32} />
            <AiFillLinkedin fontSize={40} />
          </LinkGroup>
        </DeveloperDesc>
        <DeveloperDesc>
          <Splah src={C} />
          <h3>이태민</h3>
          <p>Data Screen</p>
          <p>UI / UX</p>
          <p>iOS dev</p>
          <LinkGroup>
            <GoMarkGithub fontSize={38} />
            <GrFacebook fontSize={32} />
            <AiFillLinkedin fontSize={40} />
          </LinkGroup>
        </DeveloperDesc>
      </Contents>
    </Container>
  );
};

export default Developer;
