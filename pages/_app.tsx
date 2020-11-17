import theme from '../theme/theme'
import { ThemeProvider } from '@emotion/react'
import React from 'react'
import { AppProps } from 'next/app'
import 'normalize.css'
import GlobalStyles from '../components/GlobalStyles/GlobalStyles'

const MyApp = ({ Component, pageProps }: AppProps) => {
  return (
    <>
      <ThemeProvider theme={theme}>
        <GlobalStyles />
        <Component {...pageProps}/>
      </ThemeProvider>
    </>
  )
}

export default MyApp
