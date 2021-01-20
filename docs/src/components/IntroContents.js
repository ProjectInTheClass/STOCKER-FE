import React from "react";
import styled from "styled-components";
import mainImg from "../img/mainImg2.png";
import OpacityBlock from "./ReuseableComponens/OpacityBlock";

const IndexContainer = styled.div`
  width: 100%;
  height: auto;
  display: flex;
  justify-content: center;
`;

const IndexMainView = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 90vh;
`;

const MainBackgroundImg = styled.div`
  width: 100%;
  height: 85vh;
  /* Background Fix code */
  background: url(${(props) => props.img}) no-repeat center/cover;
  background-attachment: fixed;
`;

// const OpacityBlock = styled.div`
//   width: 100%;
//   height: ${backgroundHeight};
//   background-color: rgba(255, 255, 255, 0.2);
//   z-index: 5;
//   display: flex;
//   flex-direction: column;
//   justify-content: center;
//   align-items: center;
// `;

const IndexContextContainer = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: auto;
  height: 480px;
  h1 {
    font-size: 5rem;
    color: white;
    margin-bottom: 1rem;
  }
  p {
    font-size: 2rem;
    color: white;
  }

  @media screen and (min-width: 768px) and(max-width: 991px) {
  }
  @media screen and (max-width: 767px) {
    h1 {
      font-size: 3rem;
    }
  }
`;

const MoreButton = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  color: red;
  height: 4rem;
  width: 15rem;
  border-radius: 6px;
  left: 50%;
  bottom: 0;
  z-index: 6;
  transform: translate(0%, -50%);
  background-color: white;
  border: 1px solid #dee2e6;
  cursor: pointer;
  &:hover {
    background-color: #f8f9fa;
  }

  p {
    font-size: 1.25rem;
    color: #495057;
    font-weight: bold;
  }

  @media screen and (min-width: 768px) and(max-width: 991px) {
    transform: translate(0%, 0%);
  }

  @media screen and (max-width: 767px) {
    height: 2.5rem;
    width: 12rem;
    p {
      font-size: 0.875rem;
    }
  }
`;

const IntroContents = () => {
  return (
    <IndexContainer>
      <IndexMainView>
        <MainBackgroundImg img={mainImg}>
          <OpacityBlock height={"85vh"} />
          <IndexContextContainer>
            <h1>EvertSports</h1>
            <p>모두가 하나되는 운동</p>
          </IndexContextContainer>
        </MainBackgroundImg>
        <MoreButton>
          <p>자세히 알아보기</p>
        </MoreButton>
      </IndexMainView>
    </IndexContainer>
  );
};

export default IntroContents;
