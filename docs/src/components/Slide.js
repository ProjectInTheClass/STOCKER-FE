import React from "react";
import styled from "styled-components";

const SlideGroup = styled.div`
  display: flex;
  @media screen and (max-width: 767px) {
    flex-direction: column;
  }
`;

const IMG = styled.img`
  width: 418px;
  @media screen and (max-width: 767px) {
    width: 250px;
  }
`;
//png size : 418 x 410

const ImgDescContainer = styled.div`
  width: 400px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  @media screen and (min-width: 768px) and (max-width: 991px) {
    width: 282px;
  }

  @media screen and (max-width: 767px) {
    width: 250px;
  }
`;

const ImgDesc = styled.div`
  font-weight: bold;
  padding: 0px 1rem;
  color: #868e96;
`;

const Slide = ({ img, value }) => {
  return (
    <SlideGroup>
      <IMG src={img} />
      <ImgDescContainer>
        {value === "AI" ? (
          <>
            <h3>인공지능 자세코칭 서비스</h3>
            <ImgDesc>
              <p>
                인공지능 기술을 이용하여 사용자의 자세에 대한 올바른 솔루션을
                제공합니다
              </p>
              <p>간편하고, 흥미로운 인공지능 숙제 컨텐츠를 확인하세요!</p>
            </ImgDesc>
          </>
        ) : value === "Front" ? (
          <>
            <h3>나만의 트레이너 선생님을 만나보세요!</h3>
            <ImgDesc>
              <p>나만의 스포츠 라이프를 위한 검증된 트레이너들을 소개합니다!</p>
              <p>
                자신의운동 습관과 효율적인 운동을 돕기위한 다양한 컨텐츠들을
                만나보실 수 있습니다.
              </p>
            </ImgDesc>
          </>
        ) : (
          <></>
          // <ImgDesc>백엔드</ImgDesc>
        )}
      </ImgDescContainer>
    </SlideGroup>
  );
};

export default Slide;
