# -*- coding: utf-8 -*-
"""
한글 프롬프트를 영어로 자동 번역합니다.
프롬프트에 한글(한글)이 포함되어 있으면 영어로 번역한 뒤 이미지 생성에 사용합니다.
"""

import re
import logging

_logger = logging.getLogger(__name__)

# 한글 유니코드 범위: Hangul Syllables (AC00-D7AF), Hangul Jamo (1100-11FF), Hangul Compatibility Jamo (3130-318F)
_HANGUL_PATTERN = re.compile(r'[\uAC00-\uD7AF\u1100-\u11FF\u3130-\u318F]')


def has_hangul(text):
    """텍스트에 한글이 포함되어 있는지 확인합니다."""
    if not text or not isinstance(text, str):
        return False
    return bool(_HANGUL_PATTERN.search(text.strip()))


def translate_to_english(text):
    """
    한글이 포함된 텍스트를 영어로 번역합니다.
    번역 실패 시 원문을 그대로 반환합니다.
    프롬프트 품질 향상을 위해 스타일/품질 키워드를 보강합니다.
    """
    if not text or not isinstance(text, str):
        return text
    text = text.strip()
    if not text:
        return text
    if not has_hangul(text):
        return text

    try:
        from deep_translator import GoogleTranslator
        
        # 번역 전: 한글 프롬프트에서 스타일/품질 키워드 추출 시도
        # (이미 영어로 입력된 키워드는 보존)
        original_text = text
        
        # 번역 수행
        translator = GoogleTranslator(source='ko', target='en')
        translated = translator.translate(text=text)
        
        if translated and isinstance(translated, str):
            translated = translated.strip()
            
            # 번역 품질 향상: 기본 품질 키워드가 없으면 추가
            # (프롬프트가 너무 짧거나 일반적인 경우)
            quality_keywords = ['high quality', 'detailed', 'professional']
            has_quality = any(kw in translated.lower() for kw in quality_keywords)
            
            # 번역된 텍스트가 너무 짧거나 품질 키워드가 없으면 보강
            if len(translated.split()) < 5 and not has_quality:
                # 기본 품질 키워드 추가 (자연스럽게)
                translated = f"{translated}, high quality, detailed"
            
            # 로깅 (콘솔에 출력되어 사용자가 확인 가능)
            print(f"\n[한글→영어 번역]")
            print(f"  원문: {original_text[:100]}")
            print(f"  번역: {translated[:100]}\n")
            _logger.info(f"[한글→영어 번역] {original_text[:50]}... → {translated[:50]}...")
            
            return translated
    except ImportError:
        error_msg = (
            "한글 프롬프트 번역을 위해 deep-translator가 필요합니다. "
            "설치: pip install deep-translator"
        )
        print(f"\n[경고] {error_msg}\n")
        _logger.warning(error_msg)
    except Exception as e:
        error_msg = f"한글 프롬프트 번역 실패, 원문 사용: {e}"
        print(f"\n[경고] {error_msg}\n")
        _logger.warning(error_msg)

    return text


def translate_prompts_if_needed(prompt, negative_prompt, enabled=True):
    """
    prompt, negative_prompt에 한글이 있으면 영어로 번역합니다.
    enabled가 False이면 번역하지 않고 그대로 반환합니다.
    Returns: (translated_prompt, translated_negative_prompt)
    """
    if not enabled:
        return prompt, negative_prompt

    new_prompt = prompt
    new_negative_prompt = negative_prompt

    if isinstance(prompt, list):
        new_prompt = [translate_to_english(p) if has_hangul(p) else p for p in prompt]
    elif has_hangul(prompt):
        new_prompt = translate_to_english(prompt)

    if isinstance(negative_prompt, list):
        new_negative_prompt = [translate_to_english(p) if has_hangul(p) else p for p in negative_prompt]
    elif negative_prompt and has_hangul(negative_prompt):
        new_negative_prompt = translate_to_english(negative_prompt)

    return new_prompt, new_negative_prompt
