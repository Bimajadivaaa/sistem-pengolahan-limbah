import "../styles/globals.css";
import "@rainbow-me/rainbowkit/styles.css";
import { getDefaultWallets, RainbowKitProvider } from "@rainbow-me/rainbowkit";
import type { AppProps } from "next/app";
import { configureChains, createConfig, WagmiConfig } from "wagmi";

import { publicProvider } from "wagmi/providers/public";

const { chains, publicClient} = configureChains(
  [{
    id: 97,
    name: 'Binance Smart Chain Testnet',
    network : 'bsc-testnet',
    nativeCurrency: {
      decimals: 18,
      name: 'BNB',
      symbol: 'tBNB',
    },
    rpcUrls: {
      default: { http: ['https://bsc-testnet.publicnode.com'] },
      public: { http: ['https://bsc-testnet.publicnode.com'] },
    },
    blockExplorers: {
      etherscan: { name: 'BscScan', url: 'https://testnet.bscscan.com' },
      default: { name: 'BscScan', url: 'https://testnet.bscscan.com' },
    },
    contracts: {
      multicall3: {
        address: '0xca11bde05977b3631167028862be2a173976ca11',
        blockCreated: 17422483,
      },
    },
    testnet: true,
  }],
  [publicProvider()]
);

const projectId = String(process.env.REACT_APP_WALLET_CONNECT)

const { connectors } = getDefaultWallets({
  appName: "Sistem Pengolahan Limbah",
  projectId,
  chains,
});

const wagmiConfig = createConfig({
  autoConnect: true,
  connectors,
  publicClient,
});

function MyApp({ Component, pageProps }: AppProps) {
  return (
    <WagmiConfig config={wagmiConfig}>
      <RainbowKitProvider chains={chains}>
        <Component {...pageProps} />
      </RainbowKitProvider>
    </WagmiConfig>
  );
}

export default MyApp;
