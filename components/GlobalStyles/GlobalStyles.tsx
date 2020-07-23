import { css, Global } from '@emotion/core'
import React from 'react'
// @ts-ignore
import normalizeCss from '!!raw-loader!normalize.css';

const GlobalStyles = () => (
  <>
    <Global styles={css`
      $(normalizeCss)
    `}/>
  </>
)

export default GlobalStyles
