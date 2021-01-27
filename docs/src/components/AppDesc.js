import React, { useEffect } from "react";
import styled from "styled-components";
import Aos from "aos";
import "aos/dist/aos.css";
import GuideImage1 from "../img/guide1.png";
import GuideImage2 from "../img/guide2.png";

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

const LeftComponent = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 50%;

  border: 1px solid black;
  h1 {
    color: #4263eb;
  }

  p {
    color: #495057;
    font-weight: bold;
  }

  @media screen and (min-width: 768px) and (max-width: 991px) {
    width: 400px;
  }

  @media screen and (max-width: 767px) {
    width: 60%;
  }
`;

const RightComponent = styled.div`
  display: flex;
  justify-content: center;
  width: 50%;
  border: 1px solid black;
  @media screen and (min-width: 768px) and (max-width: 991px) {
    width: 300px;
    img {
      width: 300px;
    }
  }

  @media screen and (max-width: 767px) {
    width: 40%;
    img {
      display: none;
    }
  }
`;

const DescComponent = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 50%;
`;

const DescImageContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;

  width: 300px;
  height: 300px;
  border-radius: 50%;
  border: 1px solid black;
  border-color: #adb5bd;

  img {
    width: 50%;
  }
`;

const AppDesc = () => {
  useEffect(() => {
    Aos.init({ duration: 2000 });
  }, []);

  return (
    <Container>
      <Contents data-aos="zoom-out">
        <LeftComponent>
          <DescComponent>
            <DescImageContainer>
              <img src={GuideImage1} />
            </DescImageContainer>
          </DescComponent>
        </LeftComponent>
        <RightComponent></RightComponent>
      </Contents>
    </Container>
  );
};

export default AppDesc;
