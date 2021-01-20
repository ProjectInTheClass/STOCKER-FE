import styled, { css } from "styled-components";
import { generateMedia } from "styled-media-query";

const customMedia = generateMedia({
  lgDesktop: "1350px",
  mdDesktop: "1150px",
  tablet: "960px",
  smTablet: "740px",
});

const Colors = {
  redColor: "#D30913",
  whiteColor: "#FFFFFF",
  grayColor: "#40414A",
  blackColor: "#000000",
  successColor: "#55efc4",
  warningColor: "#fdcb6e",
  dangerColor: "#e84393",
};
const wrapper = css`
  ${customMedia.greaterThan("lgDesktop")`
      background-color: ${Colors.successColor};
  `}
  ${customMedia.between("mdDesktop", "lgDesktop")`
      background-color: ${Colors.warningColor};
  `}
  ${customMedia.between("tablet", "mdDesktop")`
      background-color: ${Colors.dangerColor};
  `}
    ${customMedia.between("smTablet", "tablet")`
      background-color: ${Colors.successColor};
  `}
  ${customMedia.lessThan("smTablet")`
      background-color: ${Colors.warningColor};
  `}
`;

const BoxColor = css`
  background-color: ${Colors.blackColor};
  color: ${Colors.whiteColor};
`;

const theme = {
  ...Colors,
  BoxColor,
  wrapper,
};
export default theme;
