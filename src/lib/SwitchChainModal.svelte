<script lang="ts">
	import { defaultEvmStores, web3 } from 'svelte-web3';
	import { SupportedChains } from './SupportedChains';
	let title: string | undefined = 'Switch to supported chain';

	const switchChain = (chainId: number) => {
		(window as any).ethereum.request({
			method: 'wallet_switchEthereumChain',
			params: [{ chainId: $web3.utils.toHex(chainId) }]
		});
	};
</script>

<h2>{title}</h2>
{#each SupportedChains as chain}
	<button on:click={() => switchChain(chain.chainId)}>{chain.name}</button>
{/each}

<style>
	h2 {
		font-size: 2rem;
		text-align: center;
	}
</style>
