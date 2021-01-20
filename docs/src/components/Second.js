import React from "react";
import styled from "styled-components";
import brandLogo from "../img/EverySports.png";

const Container = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
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

const BrandLogo = styled.img`
  display: flex;
  width: 18rem;
  height: 18rem;
  margin-right: 3rem;
  transition: 0.3s ease-in;
  @media screen and (max-width: 767px) {
    display: none;
  }
`;

const BrandDescContainer = styled.div`
  width: 500px;
  h1 {
    margin-top: 0;
    color: #20c997;
  }
  p {
    color: #868e96;
    font-weight: bold;
  }
`;

const Second = () => {
  return (
    <Container>
      <Contents>
        <BrandLogo src={brandLogo} />
        <BrandDescContainer>
          <h1>EverySports</h1>
          <p>
            저희 EverySports는 인공지능과 컴퓨터 비전 기술을 융합하여 스포츠
            인공지능 소프트웨어를 개발하는 인공지능 스포츠 IT 솔루션 회사입니다.
            저희는 모든 생활체육인이(Everyone) 모든 스포츠에서(Every Sports)
            전문 스포츠인의 경험을 손쉽게 누릴 수 있도록 도와주는 인공지능
            소프트웨어를 개발하는 것을 목표로 하고 있습니다.
          </p>
        </BrandDescContainer>
      </Contents>
    </Container>
  );
};

export default Second;
